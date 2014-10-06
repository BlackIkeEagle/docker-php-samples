FROM blackikeeagle/archlinux
MAINTAINER Ike Devolder, ike.devolder@gmail.com

RUN pacman -Syu --noconfirm nginx
RUN pacman -Scc --noconfirm
RUN mkdir -p /etc/nginx/conf.d
RUN mkdir -p /etc/nginx/sites-available
RUN mkdir -p /etc/nginx/sites-enabled
ADD ./config/nginx.conf /etc/nginx/nginx.conf
ADD ./config/01-wordpress.conf /etc/nginx/sites-available/01-wordpress.conf
ADD ./config/02-mybb.conf /etc/nginx/sites-available/02-mybb.conf
ADD ./config/03-owncloud.conf /etc/nginx/sites-available/03-owncloud.conf
RUN ln -s /etc/nginx/sites-available/01-wordpress.conf /etc/nginx/sites-enabled/01-wordpress.conf
RUN ln -s /etc/nginx/sites-available/02-mybb.conf /etc/nginx/sites-enabled/02-mybb.conf
RUN ln -s /etc/nginx/sites-available/03-owncloud.conf /etc/nginx/sites-enabled/03-owncloud.conf

EXPOSE 80

CMD ["/usr/sbin/nginx"]
