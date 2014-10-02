#!/bin/bash
docker run -v /srv/owncloud:/srv/owncloud -p 127.0.0.1:9003:9000 sample/owncloud-fpm
#docker run -v /srv/owncloud:/srv/owncloud -p 127.0.0.1:9003:9000 -i -t sample/owncloud-fpm /bin/bash
