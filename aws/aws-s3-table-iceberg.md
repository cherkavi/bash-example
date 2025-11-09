# AWS CLI + Athena example for working with an Iceberg table on S3:
* operations: 
  1. [create database](#1-create-database-if-not-exists)
  2. [create table](#2-create-iceberg-table-on-s3)
  3. [insert rows](#3-insert-rows)
  4. [query](#4-query-show-full-table)
  5. [delete rows](#5-delete-rows)
  6. [drop table](#6-drop-table-removes-metadata-underlying-files-may-remain)
  7. [remove files](#7-optionally-remove-the-underlying-s3-path-irreversible-using-aws-s3)
* Prereqs:
  - AWS CLI v2 configured (aws configure) with a principal that can use Athena, S3, and Glue (if using Glue catalog)
  - Athena engine in your account that has Iceberg support enabled (or a compatible engine)
  - An S3 bucket for the Iceberg warehouse and an S3 path for Athena query results

## common part
```sh
set -euo pipefail

export AWS_REGION="us-east-1"                          # e.g. us-east-1
export ATHENA_OUTPUT_S3="s3://my-athena-query-results/" # Athena query results location (must exist)
export ICEBERG_WAREHOUSE="s3://my-iceberg-bucket/iceberg_warehouse" # where Iceberg stores table metadata & data
export DATABASE="iceberg_db"
export TABLE="my_table"
export WORKGROUP="primary"                             # optional: Athena workgroup
export POLL_SECONDS=2

# run an Athena query, wait for completion, and optionally print results for SELECTs.
function run_query() {
  local sql="$1"
  local print_results="${2:-false}"   # if true, fetch and print query results (good for SELECT)
  echo "Running SQL ->"
  echo "$sql"
  local qid
  qid=$(aws athena start-query-execution \
    --query-string "$sql" \
    --result-configuration "OutputLocation=${ATHENA_OUTPUT_S3}" \
    --work-group "${WORKGROUP}" \
    --output text \
    --query 'QueryExecutionId')
  echo "QueryExecutionId: $qid"

  # poll for state
  while true; do
    state=$(aws athena get-query-execution --query-execution-id "$qid" \
      --output json | jq -r '.QueryExecution.Status.State')
    case "$state" in
      SUCCEEDED)
        echo "Query SUCCEEDED"
        break
        ;;
      FAILED|CANCELLED)
        reason=$(aws athena get-query-execution --query-execution-id "$qid" \
          --output json | jq -r '.QueryExecution.Status.StateChangeReason // ""')
        echo "Query $state: $reason" >&2
        exit 1
        ;;
      *)
        echo "Query status: $state. Sleeping ${POLL_SECONDS}s..."
        sleep "$POLL_SECONDS"
        ;;
    esac
  done

  if [ "$print_results" = "true" ]; then
    # Fetch and print the results (first row is column names)
    aws athena get-query-results --query-execution-id "$qid" --output json | jq -r '.ResultSet.Rows[] | [.Data[].VarCharValue // ""] | @tsv'
  fi
}
```

## 1) CREATE DATABASE (if not exists)
```sh
run_query "CREATE DATABASE IF NOT EXISTS ${DATABASE};"
```

## 2) CREATE ICEBERG TABLE on S3
> Note: SQL dialect/syntax for Iceberg may vary by engine. Athena / Glue may accept one of:  
>   - USING ICEBERG ... LOCATION 's3://...'  
>   - STORED AS ICEBERG LOCATION 's3://...'  
> If the following CREATE fails in your environment, replace the CREATE TABLE line with engine-specific DDL.  
```sh
run_query "CREATE TABLE IF NOT EXISTS ${DATABASE}.${TABLE} (
  id BIGINT,
  data VARCHAR
)
USING ICEBERG
LOCATION '${ICEBERG_WAREHOUSE}/db/${TABLE}';
"
```

## 3) INSERT rows
```sh
run_query "INSERT INTO ${DATABASE}.${TABLE} VALUES (1, 'alpha'), (2, 'bravo');"
run_query "INSERT INTO ${DATABASE}.${TABLE} VALUES (3, 'charlie'), (4, 'delta');"
```


## 4) QUERY: show full table
```sh
echo "Full table:"
run_query "SELECT * FROM ${DATABASE}.${TABLE} ORDER BY id;" true
```

## 5) DELETE row(s)
> Note:# Iceberg row-level deletes require engine support. If Athena/your engine supports DELETE:
```sh
run_query "DELETE FROM ${DATABASE}.${TABLE} WHERE id = 2;"

echo "After delete:"
run_query "SELECT * FROM ${DATABASE}.${TABLE} ORDER BY id;" true
```


## 6) DROP TABLE (removes metadata; underlying files may remain)
```sh
run_query "DROP TABLE IF EXISTS ${DATABASE}.${TABLE};"
```

## 7) Optionally remove the underlying S3 path (irreversible) using aws s3
```sh
read -r -p "Do you want to delete the S3 warehouse path for this table (${ICEBERG_WAREHOUSE}/db/${TABLE})? Type YES to proceed: " CONFIRM
if [ "$CONFIRM" = "YES" ]; then
  echo "Deleting S3 objects under ${ICEBERG_WAREHOUSE}/db/${TABLE} ..."
  aws s3 rm "${ICEBERG_WAREHOUSE}/db/${TABLE}" --recursive
  echo "S3 cleanup complete."
else
  echo "Skipping S3 cleanup. Table metadata dropped; data files remain in S3."
fi
```