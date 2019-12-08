values[$N] {
    duplicates[$N]
}
!values[$N] {
    values[$N]=1
}
END {
    for ( each_value in duplicates ){
        print each_value
    }
}