line="/mapr/dp.prod.zurich/vantage/data/store/processed/ingest-pipeline/v6/BX29/2021/02/10/2aaaac9e-bzc2-4274-ac80-0999994b31c1/Metadata/file_info.json"

echo $line  | awk -F '/' '{if(NF==16){start_column=14}else{start_column=15};for(i=start_column;i<=(NF);i++){if(i==start_column){printf($i)}else{printf("/"$i)}};printf("\n")}'
