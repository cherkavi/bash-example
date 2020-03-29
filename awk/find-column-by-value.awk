{
    for (column_item = 1; column_item <= NF; column_item++){
            if($column_item=="perform:")print $(column_item+1)
    }
}
