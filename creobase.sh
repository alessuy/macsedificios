#! /bin/bash

ruta="/var/www/html/macsedificios"
for j in $(ls $ruta/data)
do
	for i in $(cat $ruta/data/$j)
	do
		if ! [ -f $ruta/bds/$i.rrd ]
        	then
                	ini=$(date +%s)
                	rrdtool create  $ruta/bds/$i.rrd --start $ini --step 300 DS:datos:GAUGE:600:0:U \
                	RRA:AVERAGE:0.5:1:600 \
                	RRA:AVERAGE:0.5:6:700 \
                	RRA:AVERAGE:0.5:24:775 \
                	RRA:AVERAGE:0.5:288:797 \
                	RRA:MAX:0.5:1:600 \
                	RRA:MAX:0.5:6:700 \
                	RRA:MAX:0.5:24:775 \
                	RRA:MAX:0.5:288:797 \
                	RRA:MIN:0.5:1:600 \
                	RRA:MIN:0.5:6:700 \
                	RRA:MIN:0.5:24:775  \
                	RRA:MIN:0.5:288:797

        	fi
	done
done

