FROM ubuntu:12.04
MAINTAINER Ike Devolder <ike.devolder@gmail.com>

# Keep upstart from complaining
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y upgrade

# wordpress php deps
RUN apt-get -y install php5-fpm php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-ps php5-pspell php5-recode php5-sqlite php5-tidy php5-xmlrpc php5-xsl php-apc

RUN sed -e 's/.*daemonize.*/daemonize = no/' -i /etc/php5/fpm/php-fpm.conf
RUN sed -e 's/.*cgi.fix_pathinfo.*/cgi.fix_pathinfo=0/' -e 's/upload_max_filesize.*/upload_max_filesize = 100M/' -e 's/post_max_size.*/post_max_size = 100M/' -i /etc/php5/fpm/php.ini
RUN sed 's/.*listen =.*/listen = 0.0.0.0:9000/' -i /etc/php5/fpm/pool.d/www.conf
RUN sed -e 's/.*listen =.*/listen = 0.0.0.0:9000/' -e 's/.*catch_workers_output.*/catch_workers_output = yes/' -i /etc/php5/fpm/pool.d/www.conf
RUN echo "php_admin_value[error_log] = stdout\nphp_admin_flag[log_errors] = on" >> /etc/php5/fpm/pool.d/www.conf

EXPOSE 9000

CMD ["/usr/sbin/php5-fpm"]
