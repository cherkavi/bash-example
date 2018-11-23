BEGIN{line=""}
{
	if(line==""){line=$0}
	else{
		print line" <=> "$0; 
		line=""
	}
}