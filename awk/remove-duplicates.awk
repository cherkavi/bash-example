!values[$N] {
    values[$N]
    #values[$N]=""
}
END {
    for ( each_value in values ){
        print each_value
    }
}