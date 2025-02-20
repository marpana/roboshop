#!/bin/bash
#set -e
dnf install nginx -y
echo frontend setup............
if [ $? -ne 0 ]; then
  echo "Nginx install Failed.."
  exit
fi

systemctl enable nginx
systemctl start nginx
rm -rf /usr/share/nginx/html/*

curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip

if [ $? -ne 0 ]; then
  echo "Download Frontend Failed.."
  exit
fi

cd /usr/share/nginx/html
unzip /tmp/frontend.zip

systemctl restart nginx


