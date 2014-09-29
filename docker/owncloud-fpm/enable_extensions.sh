#!/bin/sh

sed \
	-e 's/^open_basedir/;open_basedir/' \
	-e 's/^;extension=curl\.so/extension=curl\.so/' \
	-e 's/^;extension=exif\.so/extension=exif\.so/' \
	-e 's/^;extension=gd\.so/extension=gd\.so/' \
	-e 's/^;extension=iconv\.so/extension=iconv\.so/' \
	-e 's/^;extension=mcrypt\.so/extension=mcrypt\.so/' \
	-e 's/^;extension=mysqli\.so/extension=mysqli\.so/' \
	-e 's/^;extension=mysql\.so/extension=mysql\.so/' \
	-e 's/^;extension=openssl\.so/extension=openssl\.so/' \
	-e 's/^;extension=pdo_mysql\.so/extension=pdo_mysql\.so/' \
	-e 's/^;extension=zip\.so/extension=zip\.so/' \
	-i /etc/php/php.ini
