#!/bin/bash
docker run -v /srv/owncloud:/srv/owncloud -p 192.168.1.1:9003:9000 sample/owncloud-fpm
