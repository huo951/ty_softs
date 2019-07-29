#!/bin/bash

echo "开始安装nginx[TY]"

cd ~

wget https://github.com/huo951/ty_softs/blob/master/softs/nginx-1.14.0.tar.gz

tar xvf nginx-1.14.0.tar.gz
cd nginx-1.14.0/
./configure --prefix=/usr/local/nginx --with-http_ssl_module

 make && make install

 echo "安装nginx成功"