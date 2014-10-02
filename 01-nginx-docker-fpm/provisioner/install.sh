#!/bin/bash

pacman -Syu --noconfirm vim unzip percona-server-clients nginx docker

install -Dm644 /vagrant/provisioner/system/50-docker.conf /etc/sysctl.d/50-docker.conf

cp -a /usr/lib/systemd/system/docker.service /etc/systemd/system/
sed -e 's/^ExecStart.*/ExecStart=\/usr\/bin\/docker --bip=192.168.1.1\/24 -d -H fd:\/\//' -i /etc/systemd/system/docker.service
systemctl start docker.service

mkdir -p /etc/nginx/sites-enabled

rm /etc/nginx/nginx.conf
install -Dm644 /vagrant/provisioner/nginx/nginx.conf /etc/nginx/nginx.conf

# percona
(
cd /var/docker/percona
./build.sh
./init.sh
./run.sh &
sleep 10
mysql -uadmin -padmin -h127.0.0.1 -e 'CREATE DATABASE wordpress DEFAULT CHARSET UTF8;'
mysql -uadmin -padmin -h127.0.0.1 -e 'CREATE DATABASE mybb DEFAULT CHARSET UTF8;'
mysql -uadmin -padmin -h127.0.0.1 -e 'CREATE DATABASE owncloud DEFAULT CHARSET UTF8;'
sleep 2
./stop.sh
)

install -Dm644 /vagrant/provisioner/system/percona.service /etc/systemd/system/percona.service

# wordpress
(
cd /srv
curl -sO https://wordpress.org/latest.tar.gz
tar xf latest.tar.gz
chown http:http wordpress
)

(
cd /var/docker/wordpress-fpm
./build.sh
)

install -Dm644 /vagrant/provisioner/nginx/01-wordpress.conf /etc/nginx/sites-enabled/01-wordpress.conf
install -Dm644 /vagrant/provisioner/system/wordpress-fpm.service /etc/systemd/system/wordpress-fpm.service
install -Dm644 /vagrant/provisioner/php/phpinfo.php /srv/wordpress/phpinfo.php

# mybb
(
cd /srv
curl -sO http://resources.mybb.com/downloads/mybb_1800.zip
unzip mybb_1800.zip
mv Upload mybb
chown http:http mybb
)

(
cd /var/docker/mybb-fpm
./build.sh
)

install -Dm644 /vagrant/provisioner/nginx/02-mybb.conf /etc/nginx/sites-enabled/02-mybb.conf
install -Dm644 /vagrant/provisioner/system/mybb-fpm.service /etc/systemd/system/mybb-fpm.service
install -Dm644 /vagrant/provisioner/php/phpinfo.php /srv/mybb/phpinfo.php

# owncloud
(
cd /srv
curl -sO https://download.owncloud.org/community/owncloud-7.0.2.tar.bz2
tar xf owncloud-7.0.2.tar.bz2
chown http:http owncloud
)

(
cd /var/docker/owncloud-fpm
./build.sh
)

install -Dm644 /vagrant/provisioner/nginx/03-owncloud.conf /etc/nginx/sites-enabled/03-owncloud.conf
install -Dm644 /vagrant/provisioner/system/owncloud-fpm.service /etc/systemd/system/owncloud-fpm.service
install -Dm644 /vagrant/provisioner/php/phpinfo.php /srv/owncloud/phpinfo.php

# enable required services
systemctl enable docker.service nginx.service percona.service wordpress-fpm.service mybb-fpm.service owncloud-fpm.service

# poweroff after install so everything will work as planed after reboot
poweroff
