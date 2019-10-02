#! /bin/sh

#Es para actualizar las imagenes en el wethermap allbse.conf

sh /var/www/cgi-bin/macsedif.sh 24h
convert -resize 30% /var/www/html/macsedificios/img/macscc.png /var/www/html/plugins/weathermap/images/macscc.png
convert -resize 30% /var/www/html/macsedificios/img/macsbl.png /var/www/html/plugins/weathermap/images/macsbl.png
convert -resize 30% /var/www/html/macsedificios/img/macsbl.png /var/www/html/plugins/weathermap/images/macsbb.png
convert -resize 30% /var/www/html/macsedificios/img/macsbl.png /var/www/html/plugins/weathermap/images/macscsm.png

