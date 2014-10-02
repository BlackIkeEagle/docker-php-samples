FROM blackikeeagle/archlinux
MAINTAINER Ike Devolder, ike.devolder@gmail.com

RUN pacman -Syu --noconfirm php-fpm php-gd php-mcrypt php-sqlite php-apcu
RUN pacman -Scc --noconfirm

RUN sed -e 's/.*cgi.fix_pathinfo.*/cgi.fix_pathinfo=0/' -i /etc/php/php.ini
RUN sed -e 's/.*listen =.*/listen = 0.0.0.0:9000/' -e 's/.*catch_workers_output.*/catch_workers_output = yes/' -i /etc/php/php-fpm.conf
RUN echo -e "php_admin_value[error_log] = stdout\nphp_admin_flag[log_errors] = on" >> /etc/php/php-fpm.conf
ADD ./enable_extensions.sh /tmp/enable_extensions.sh
RUN /bin/sh /tmp/enable_extensions.sh && rm /tmp/enable_extensions.sh
ADD ./apcu.ini /etc/php/conf.d/apcu.ini

EXPOSE 9000

CMD ["/usr/bin/php-fpm", "-F"]
