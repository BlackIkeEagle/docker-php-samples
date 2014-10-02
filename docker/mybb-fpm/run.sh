#!/bin/bash
docker run -v /srv/mybb:/srv/mybb -p 127.0.0.1:9002:9000 sample/mybb-fpm
#docker run -v /srv/mybb:/srv/mybb -p 127.0.0.1:9002:9000 -i -t sample/mybb-fpm /bin/bash
