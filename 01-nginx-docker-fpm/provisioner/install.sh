#!/bin/bash

pacman -Syu --noconfirm nginx docker

systemctl start docker.service

mkdir -p /etc/nginx/conf.d
mkdir -p /etc/nginx/sites-available
mkdir -p /etc/nginx/sites-enabled

rm /etc/nginx/nginx.conf
install -Dm644 /vagrant/provisioner/nginx.conf /etc/nginx/nginx.conf

# more nginx configuration ...

systemctl start nginx.service

systemctl enable docker.service nginx.service
