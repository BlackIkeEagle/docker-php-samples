FROM blackikeeagle/archlinux
MAINTAINER Ike Devolder, ike.devolder@gmail.com

RUN pacman -Syu --noconfirm php-fpm php-gd php-mcrypt php-sqlite php-apcu
RUN pacman -Scc --noconfirm

RUN sed 's/.*listen =.*/listen = 0.0.0.0:9000/' -i /etc/php/php-fpm.conf
ADD ./enable_extensions.sh /tmp/enable_extensions.sh
RUN /bin/sh /tmp/enable_extensions.sh && rm /tmp/enable_extensions.sh
ADD ./apcu.ini /etc/php/conf.d/apcu.ini

EXPOSE 9000
