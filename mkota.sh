#!/bin/bash
echo -n {\"datetime\": `cat $2 | cut -d "=" --output-delimiter "," -f 1,2 | awk -F, -v findex=1 -v value=post-timestamp '$findex == value {print}' | cut -d, -f 2`,\"filename\": \"$3\",\"id\": \"`sha256sum $1 | awk '{ print $1 }'`\",\"romtype\": \"unofficial\",\"size\": `stat -c%s $1`,\"url\": \"https://downloads.sourceforge.net/project/motog5/MintOS/$3\",\"version\": \"17.1\"}
