[list of all proxy, that you should open in browser and copy with mouse to text file: index.txt](http://spys.one/free-proxy-list/UA/
select with mouse, copy and paste to text file, for instance: ~/Downloads/some-file.bak


# firefox proxy plugin: switch omega
* [proxy plugin for Firefox Switch Omega](https://addons.mozilla.org/ru/firefox/addon/switchyomega/)
* translator from copied text from html page to xml for import
```bash
cat index.txt | awk 'BEGIN{a=0}{a=a+1;if(a%2==0){ printf("%s:%s:%s:%x\n",$2,$3,$6,int(4096*rand()))} }' | awk -F ":" '{printf("\"+%s\": {\"name\": \"%s\",\"profileType\": \"FixedProfile\",\"revision\": \"16b8439%s\",\"fallbackProxy\": {\"scheme\": \"%s\",\"port\": %d,\"host\": \"%s\"}},\n",$4$1,$4$1,$5,tolower($3),$2,$1)}'
```

# firefox proxy plugin: 
* [Firefox FoxyProxy](https://addons.mozilla.org/ru/firefox/addon/foxyproxy-standard/)
* translator for copied text from html page to xml for FoxyProxy.import operation
```bash
```