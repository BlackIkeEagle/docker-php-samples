#!/bin/bash
docker run -v /srv/wordpress:/srv/wordpress -p 127.0.0.1:9001:9000 sample/wordpress-fpm /usr/sbin/php5-fpm
#docker run -v /srv/wordpress:/srv/wordpress -p 127.0.0.1:9001:9000 -i -t sample/wordpress-fpm /bin/bash
