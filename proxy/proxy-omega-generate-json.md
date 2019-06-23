* [proxy plugin for Firefox should be installed](https://addons.mozilla.org/ru/firefox/addon/switchyomega/)
* export existing list of elements to: Downloads/some-file.bak
* [list of all proxy, that you should open in browser and copy with mouse to text file: index.txt](http://spys.one/free-proxy-list/UA/
* insert into Downloads/some-file.bak next lines
```bash
cat index.txt | awk 'BEGIN{a=0}{a=a+1;if(a%2==0){ printf("%s:%s:%s:%x\n",$2,$3,$6,int(4096*rand()))} }' | awk -F ":" '{printf("\"+%s\": {\"name\": \"%s\",\"profileType\": \"FixedProfile\",\"revision\": \"16b8439%s\",\"fallbackProxy\": {\"scheme\": \"%s\",\"port\": %d,\"host\": \"%s\"}},\n",$4$1,$4$1,$5,tolower($3),$2,$1)}'
```
