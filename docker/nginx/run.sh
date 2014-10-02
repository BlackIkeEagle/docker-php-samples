#!/bin/bash

docker run --name nginx \
	-v /srv/wordpress:/srv/wordpress \
	-v /srv/mybb:/srv/mybb \
	-v /srv/owncloud:/srv/owncloud \
	-p 0.0.0.0:80:80 blackikeeagle/nginx

#docker run -i -t blackikeeagle/nginx /bin/bash
