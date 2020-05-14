IFS=']' read -r -a json < ota/$2.json
NEWDATA=`./mkota.sh $1 $2`
echo ${json[1]}${NEWDATA}${json[2]}> ota/$2.json
