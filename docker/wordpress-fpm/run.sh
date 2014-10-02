#!/bin/bash
docker run -v /srv/wordpress:/srv/wordpress -p 192.168.1.1:9001:9000 sample/wordpress-fpm
