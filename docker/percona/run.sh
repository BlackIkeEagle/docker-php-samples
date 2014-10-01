#!/bin/bash

docker run --name percona -v /var/lib/mysql:/var/lib/mysql -p 0.0.0.0:3306:3306 blackikeeagle/percona
