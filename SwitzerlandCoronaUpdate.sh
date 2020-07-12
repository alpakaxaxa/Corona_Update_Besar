#!/usr/bin/bash
curl -s 'https://raw.githubusercontent.com/daenuprobst/covid19-cases-switzerland/master/summary.json' | jq -r '.changes' > changes.json
CASES=$(jq -r '.cases' changes.json)
DEATHS=$(jq -r '.fatalities' changes.json)
TODAY=$(date +"%d. %B, %Y")
SOURCE_CODE=$(cat ./SourceCode.txt)
echo "<h2>Corona Update $TODAY</h2><p>Heeei Besar, es git i dä Schwiiz $CASES neui Fäll und $DEATHS Toti</p><p>Liebe Gruess<br>Raspberry Pi vom Stephan</p><p>Source Code: <a href=\"https://github.com/alpakaxaxa/Corona_Update_Besar/blob/master/SwitzerlandCoronaUpdate.sh\">Github-Link</a></p>" | mail -s "$(echo -e "Corona Schweiz Update\nContent-Type: text/html")" stephan.dint.mueller@gmail.com
echo "Mail sent successfully!"