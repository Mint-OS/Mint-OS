#!/bin/bash
OTADIR=../MintOS_ota
ls $1 || (cd $OTADIR; git commit -m "$3: Automatic OTA Update FAILED"; cd -)
ls $1 || exit 1
IFS=']' read -r -a json < $OTADIR/$3.json
chmod +x mkota.sh
NEWDATA=`./mkota.sh $1 $2 $4`
echo "${json[0]},${NEWDATA}]${json[1]}" > $OTADIR/$3.json
cd $OTADIR
git add $3.json
git commit -m "$3: Automatic OTA Update"
cd -
