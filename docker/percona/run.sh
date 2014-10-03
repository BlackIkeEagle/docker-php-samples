#!/bin/bash

docker run --name percona -v /var/lib/mysql:/var/lib/mysql -p 192.168.1.1:3306:3306 blackikeeagle/percona
