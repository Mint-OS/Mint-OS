#!/bin/bash
echo {
echo 	\"datetime\": `cat $2 | cut -d "=" --output-delimiter "," -f 1,2 | awk -F, -v findex=1 -v value=post-timestamp '$findex == value {print}' | cut -d, -f 2`,
echo 	\"filename\": \"$1\",
echo 	\"id\": \"`sha256sum $1 | awk '{ print $1 }'`\",
echo 	\"romtype\": \"unoffical\",
echo 	\"size\": `stat -c%s $1`,
echo 	\"url\": \"https://downloads.sourceforge.net/project/mint-os-project/$1\",
echo 	\"version\": \"17.1\"
echo }
