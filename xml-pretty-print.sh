OUTPUT_FILE="kpi-as-a-service.svg"
cat $OUTPUT_FILE | python -c 'import sys;import xml.dom.minidom;s=sys.stdin.read();print(xml.dom.minidom.parseString(s).toprettyxml())'
