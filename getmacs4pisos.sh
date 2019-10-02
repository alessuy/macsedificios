#! /bin/sh

macruta="/var/www/html/macsedificios"

COMUNIDAD=""

function getmacs(){
# $1 vlan $2 edificios
	ping -c 1 $2 > /dev/null
	if [ $? -eq 0 ]
	then
		echo "$(snmpwalk -v2c -c $COMUNIDAD@$1 $2 1.3.6.1.2.1.17.4.3.1.1 | wc -l) - 1" | bc
	else 
		echo "0"
	fi
}


function updaterrd(){
#nombre : vlan2 
  ini=$(date +%s)
  rrdtool update $macruta/bds/$1.rrd $ini:$2

}

function logmacs(){
#edificio piso macs
 echo "$1 - $2 : $3" >> $macruta/logmacs 
}


echo $(date) > $macruta/logmacs

for edificio in $(ls $macruta/data/)
do
	for piso in $(cat $macruta/data/$edificio)
	do
		macs=$(getmacs $piso $edificio)
		updaterrd $piso $macs 
		logmacs $edificio $piso $macs
	done
done

