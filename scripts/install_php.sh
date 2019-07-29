#!/bin/bash

echo "开始安装php7[TY]"
echo "开始安装依赖包"

yum install  -y gcc libxml2 libxml2-devel openssl openssl-devel bzip2-devel.x86_64 curl-devel libjpeg-devel libpng libpng-devel freetype-devel libxslt libxslt-devel

cd ~

wget https://github.com/huo951/ty_softs/blob/master/softs/php-7.2.20.tar.gz
tar xvf php-7.2.20.tar.gz
cd ~/php-7.2.20

./configure --prefix=/usr/local/php --with-fpm-user=wwwroot --with-fpm-group=wwwroot --with-curl --with-freetype-dir --with-gd --with-gettext --with-iconv-dir --with-kerberos --with-libdir=lib64 --with-libxml-dir --with-mysqli --with-openssl --with-pcre-regex --with-pdo-mysql --with-pdo-sqlite --with-pear --with-png-dir --with-jpeg-dir --with-xmlrpc --with-xsl --with-zlib --with-bz2 --with-mhash --enable-fpm --enable-bcmath --enable-libxml --enable-inline-optimization --enable-mbregex --enable-mbstring --enable-opcache --enable-pcntl --enable-shmop --enable-soap --enable-sockets --enable-sysvsem --enable-sysvshm --enable-xml --enable-zip --enable-fpm

make && make install

cp php.ini-production /usr/local/php/lib/php.ini
cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf
ln -s /usr/local/php/sbin/php-fpm /usr/local/bin

mv /usr/local/php/etc/php-fpm.d/www.conf.default /usr/local/php/etc/php-fpm.d/www.conf

cp ~/php-7.2.20/sapi/fpm/php-fpm.service /usr/lib/systemd/system/

systemctl status php-fpm

systemctl start php-fpm

netstat -na|grep 9000

 echo "安装php7成功"