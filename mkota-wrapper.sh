#!/bin/bash
ls $1 || exit 1
IFS=']' read -r -a json < $3.json
chmod +x mkota.sh
NEWDATA=`./mkota.sh $1 $2 $4`
echo "${json[0]},${NEWDATA}]${json[1]}" > $3.json
git add $3.json
git pull
git commit -m "$3: Automatic OTA Update"
git push github-ssh HEAD:ota
