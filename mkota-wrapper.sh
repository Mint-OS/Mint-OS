#!/bin/bash
ls $1 || (cd $5; git commit -m "$3: Automatic OTA Update FAILED"; cd -)
ls $1 || exit 1 
IFS=']' read -r -a json < $5/$3.json
chmod +x mkota.sh
NEWDATA=`./mkota.sh $1 $2 $4`
echo "${json[0]},${NEWDATA}]${json[1]}" > $5/$3.json
cd $5
git add $3.json
git commit -m "$3: Automatic OTA Update"
cd -
