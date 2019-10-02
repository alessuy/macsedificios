#! /bin/sh

echo "Content-type: text/html;charset=ISO-8859"
echo ""

echo "<html><head><META HTTP-EQUIV=\"refresh\" CONTENT=\"60\"></head><body>"
web="/macsedificios"
bd="/var/www/html/macsedificios/bds"
img="/var/www/html/macsedificios/img"
data="/var/www/html/macsedificios/data"

graficascc(){
#$1 tiempo
        rrdtool graph  $img/macscc.png  \
        --imgformat PNG \
        --start now-$1  \
        --end now \
	-l 0 \
        --title "Cantidad de MACS en CC"  \
        --vertical-label "# MACS" \
        --height 250 \
        --width 600 \
        --color ARROW#0000FF \
        -W "www.bse.com.uy" \
        DEF:d7=$bd/7.rrd:datos:AVERAGE \
        DEF:d8=$bd/8.rrd:datos:AVERAGE \
        DEF:d9=$bd/9.rrd:datos:AVERAGE \
        DEF:d10=$bd/10.rrd:datos:AVERAGE \
        DEF:d20=$bd/20.rrd:datos:AVERAGE \
        DEF:d30=$bd/30.rrd:datos:AVERAGE \
        DEF:d40=$bd/40.rrd:datos:AVERAGE \
        DEF:d50=$bd/50.rrd:datos:AVERAGE \
        DEF:d60=$bd/60.rrd:datos:AVERAGE \
	DEF:d70=$bd/70.rrd:datos:AVERAGE \
        DEF:d80=$bd/80.rrd:datos:AVERAGE \
        DEF:d1051=$bd/1051.rrd:datos:AVERAGE \
	CDEF:tot=d7,d8,+,d9,+,d10,+,d20,+,d30,+,d40,+,d50,+,d60,+,d70,+,d80,+,d1051,+ \
	COMMENT:"          ACTUAL    MAXIMO\n" \
        AREA:d7#8FBC8F:"1S-CC " \
        GPRINT:d7:LAST:"%5.0lf " \
        GPRINT:d7:MAX:"%5.0lf \n" \
        STACK:d8#00BFFF:"PB-CC " \
        GPRINT:d8:LAST:"%5.0lf " \
        GPRINT:d8:MAX:"%5.0lf \n" \
	STACK:d9#F4A460:"EP-CC " \
        GPRINT:d9:LAST:"%5.0lf " \
        GPRINT:d9:MAX:"%5.0lf \n" \
	STACK:d10#FFD700:"P1-CC " \
        GPRINT:d10:LAST:"%5.0lf " \
        GPRINT:d10:MAX:"%5.0lf \n" \
        STACK:d20#00FA9A:"P2-CC " \
        GPRINT:d20:LAST:"%5.0lf " \
        GPRINT:d20:MAX:"%5.0lf \n" \
        STACK:d30#BDB76B:"P3-CC " \
        GPRINT:d30:LAST:"%5.0lf " \
        GPRINT:d30:MAX:"%5.0lf \n" \
        STACK:d40#6495ED:"P4-CC " \
        GPRINT:d40:LAST:"%5.0lf " \
        GPRINT:d40:MAX:"%5.0lf \n" \
        STACK:d50#FF69B4:"P5-CC " \
        GPRINT:d50:LAST:"%5.0lf " \
        GPRINT:d50:MAX:"%5.0lf \n" \
        STACK:d60#E9967A:"P6-CC " \
        GPRINT:d60:LAST:"%5.0lf " \
        GPRINT:d60:MAX:"%5.0lf \n" \
	STACK:d70#00CED1:"P7-CC " \
        GPRINT:d70:LAST:"%5.0lf " \
        GPRINT:d70:MAX:"%5.0lf \n" \
        STACK:d80#00FF7F:"P8-CC " \
        GPRINT:d80:LAST:"%5.0lf " \
        GPRINT:d80:MAX:"%5.0lf \n"  \
	STACK:d1051#BC8F8F:"Telef." \
        GPRINT:d1051:LAST:"%5.0lf " \
        GPRINT:d1051:MAX:"%5.0lf \n" \
	LINE2:tot#000000:"Total " \
        GPRINT:tot:LAST:"%5.0lf " \
        GPRINT:tot:MAX:"%5.0lf \n"  > /dev/null
}


graficasbb(){
#$1 tiempo
        rrdtool graph  $img/macsbb.png  \
        --imgformat PNG \
        --start now-$1  \
        --end now \
        -l 0 \
        --title "Cantidad de MACS en BB"  \
        --vertical-label "# MACS" \
        --height 250 \
        --width 600 \
        --color ARROW#0000FF \
        -W "www.bse.com.uy" \
        DEF:d807=$bd/807.rrd:datos:AVERAGE \
        DEF:d808=$bd/808.rrd:datos:AVERAGE \
        DEF:d810=$bd/810.rrd:datos:AVERAGE \
        DEF:d820=$bd/820.rrd:datos:AVERAGE \
        DEF:d830=$bd/830.rrd:datos:AVERAGE \
        DEF:d1080=$bd/1080.rrd:datos:AVERAGE \
	CDEF:tot=d807,d808,+,d810,+,d820,+,d830,+,d1080,+ \
	COMMENT:"          ACTUAL    MAXIMO\n" \
        AREA:d807#8FBC8F:"PP-BB " \
        GPRINT:d807:LAST:"%5.0lf " \
        GPRINT:d807:MAX:"%5.0lf \n" \
        STACK:d808#00BFFF:"PB-BB " \
        GPRINT:d808:LAST:"%5.0lf " \
        GPRINT:d808:MAX:"%5.0lf \n" \
        STACK:d810#F4A460:"P1-BB " \
        GPRINT:d810:LAST:"%5.0lf " \
        GPRINT:d810:MAX:"%5.0lf \n" \
        STACK:d820#FFD700:"P2-BB " \
        GPRINT:d820:LAST:"%5.0lf " \
        GPRINT:d820:MAX:"%5.0lf \n" \
        STACK:d830#00FA9A:"P3-BB " \
        GPRINT:d830:LAST:"%5.0lf " \
        GPRINT:d830:MAX:"%5.0lf \n" \
	STACK:d1080#BDB76B:"Telef." \
        GPRINT:d1080:LAST:"%5.0lf " \
        GPRINT:d1080:MAX:"%5.0lf \n" \
	LINE2:tot#000000:"Total " \
        GPRINT:tot:LAST:"%5.0lf " \
        GPRINT:tot:MAX:"%5.0lf \n"  > /dev/null
}

graficascsm(){
#$1 tiempo
        rrdtool graph  $img/macscsm.png  \
        --imgformat PNG \
        --start now-$1  \
        --end now \
        -l 0 \
        --title "Cantidad de MACS en CSM"  \
        --vertical-label "# MACS" \
        --height 250 \
        --width 600 \
        --color ARROW#0000FF \
        -W "www.bse.com.uy" \
        DEF:d407=$bd/407.rrd:datos:AVERAGE \
        DEF:d408=$bd/408.rrd:datos:AVERAGE \
        DEF:d410=$bd/410.rrd:datos:AVERAGE \
        DEF:d420=$bd/420.rrd:datos:AVERAGE \
        DEF:d430=$bd/430.rrd:datos:AVERAGE \
        DEF:d440=$bd/440.rrd:datos:AVERAGE \
        DEF:d450=$bd/450.rrd:datos:AVERAGE \
        DEF:d608=$bd/608.rrd:datos:AVERAGE \
        DEF:d610=$bd/610.rrd:datos:AVERAGE \
        DEF:d620=$bd/620.rrd:datos:AVERAGE \
        DEF:d1086=$bd/1086.rrd:datos:AVERAGE \
	CDEF:tot=d407,d408,+,d410,+,d420,+,d430,+,d440,+,d450,+,d608,+,d610,+,d620,+,d1086,+ \
        COMMENT:"          ACTUAL    MAXIMO\n" \
        AREA:d407#8FBC8F:"1S-CSM " \
        GPRINT:d407:LAST:"%5.0lf " \
        GPRINT:d407:MAX:"%5.0lf \n" \
        STACK:d408#00BFFF:"PB-CSM " \
        GPRINT:d408:LAST:"%5.0lf " \
        GPRINT:d408:MAX:"%5.0lf \n" \
        STACK:d410#F4A460:"P1-CSM " \
        GPRINT:d410:LAST:"%5.0lf " \
        GPRINT:d410:MAX:"%5.0lf \n" \
        STACK:d420#FFD700:"P2-CSM " \
        GPRINT:d420:LAST:"%5.0lf " \
        GPRINT:d420:MAX:"%5.0lf \n" \
        STACK:d430#00FA9A:"P3-CSM " \
        GPRINT:d430:LAST:"%5.0lf " \
        GPRINT:d430:MAX:"%5.0lf \n" \
        STACK:d440#BDB76B:"P4-CSM " \
        GPRINT:d440:LAST:"%5.0lf " \
        GPRINT:d440:MAX:"%5.0lf \n" \
        STACK:d450#6495ED:"P5-CSM " \
        GPRINT:d450:LAST:"%5.0lf " \
        GPRINT:d450:MAX:"%5.0lf \n" \
        STACK:d608#FF69B4:"PB-ACSM" \
        GPRINT:d608:LAST:"%5.0lf " \
        GPRINT:d608:MAX:"%5.0lf \n" \
        STACK:d610#E9967A:"P1-ACSM" \
        GPRINT:d610:LAST:"%5.0lf " \
        GPRINT:d610:MAX:"%5.0lf \n" \
        STACK:d620#00CED1:"P2-ACSM" \
        GPRINT:d620:LAST:"%5.0lf " \
        GPRINT:d620:MAX:"%5.0lf \n" \
	STACK:d1086#00FF7F:"Telef. " \
        GPRINT:d1086:LAST:"%5.0lf " \
        GPRINT:d1086:MAX:"%5.0lf \n" \
	LINE2:tot#000000:"Total  " \
        GPRINT:tot:LAST:"%5.0lf " \
        GPRINT:tot:MAX:"%5.0lf \n"  > /dev/null
}

graficasbl(){
#$1 tiempo
        rrdtool graph  $img/macsbl.png  \
        --imgformat PNG \
        --start now-$1  \
        --end now \
        -l 0 \
        --title "Cantidad de MACS en BL"  \
        --vertical-label "# MACS" \
        --height 250 \
        --width 600 \
        --color ARROW#0000FF \
        -W "www.bse.com.uy" \
        DEF:d208=$bd/208.rrd:datos:AVERAGE \
        DEF:d210=$bd/210.rrd:datos:AVERAGE \
        DEF:d220=$bd/220.rrd:datos:AVERAGE \
        DEF:d230=$bd/230.rrd:datos:AVERAGE \
        DEF:d250=$bd/250.rrd:datos:AVERAGE \
        DEF:d320=$bd/320.rrd:datos:AVERAGE \
        DEF:d330=$bd/330.rrd:datos:AVERAGE \
        DEF:d340=$bd/340.rrd:datos:AVERAGE \
        DEF:d1065=$bd/1065.rrd:datos:AVERAGE \
	CDEF:tot=d208,d210,+,d220,+,d230,+,d250,+,d320,+,d330,+,d340,+,d1065,+ \
        COMMENT:"          ACTUAL    MAXIMO\n" \
        AREA:d208#8FBC8F:"PB-BL " \
        GPRINT:d208:LAST:"%5.0lf " \
        GPRINT:d208:MAX:"%5.0lf \n" \
        STACK:d210#00BFFF:"P1-BL " \
        GPRINT:d210:LAST:"%5.0lf " \
        GPRINT:d210:MAX:"%5.0lf \n" \
        STACK:d220#F4A460:"P2-BL " \
        GPRINT:d220:LAST:"%5.0lf " \
        GPRINT:d220:MAX:"%5.0lf \n" \
        STACK:d230#FFD700:"P3-BL " \
        GPRINT:d230:LAST:"%5.0lf " \
        GPRINT:d230:MAX:"%5.0lf \n" \
        STACK:d250#00FA9A:"P5-BL " \
        GPRINT:d250:LAST:"%5.0lf " \
        GPRINT:d250:MAX:"%5.0lf \n" \
        STACK:d320#BDB76B:"P12-BL" \
        GPRINT:d320:LAST:"%5.0lf " \
        GPRINT:d320:MAX:"%5.0lf \n" \
        STACK:d330#6495ED:"P13-BL" \
        GPRINT:d330:LAST:"%5.0lf " \
        GPRINT:d330:MAX:"%5.0lf \n" \
        STACK:d340#FF69B4:"P14-BL" \
        GPRINT:d340:LAST:"%5.0lf " \
        GPRINT:d340:MAX:"%5.0lf \n" \
        STACK:d1065#E9967A:"Telef." \
        GPRINT:d1065:LAST:"%5.0lf " \
        GPRINT:d1065:MAX:"%5.0lf \n" \
	LINE2:tot#000000:"Total  " \
        GPRINT:tot:LAST:"%5.0lf " \
        GPRINT:tot:MAX:"%5.0lf \n"  > /dev/null

}



graficascc $1
graficasbb $1
graficascsm $1
graficasbl $1

echo "<div align=center><img src=$web/img/macscc.png><img src=$web/img/macsbb.png><BR><img src=$web/img/macscsm.png><img src=$web/img/macsbl.png><br></div><br><br></body></html>"

exit 0
