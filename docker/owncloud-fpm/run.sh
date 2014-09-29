#!/bin/bash
docker run -v /srv/owncloud:/srv/owncloud -p 127.0.0.1:9003:9000 sample/owncloud-fpm /usr/bin/php-fpm --nodaemonize
#docker run -v /srv/owncloud:/srv/owncloud -p 127.0.0.1:9003:9000 -i -t sample/owncloud-fpm /bin/bash
