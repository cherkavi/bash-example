BEGIN{
    container="";
    upload_time="";
}
{
	if( index($0, "Log Time:") != 0){
        upload_time=substr($0, 16)
    }else if (index($0, "Container: r") != 0) {
        container=substr($0, index($0, " on ") + 4 )
	}else if (  (index($0, "KafkaException: ") != 0) || (index($0, "Log aggregation has not completed") != 0)  ) {
        print container"<=>"upload_time"<=>"$0; 
    }
}
