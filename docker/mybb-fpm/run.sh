#!/bin/bash
docker run -v /srv/mybb:/srv/mybb -p 192.168.1.1:9002:9000 sample/mybb-fpm
