#!/bin/bash

yum install nginx -y
systemctl start nginx
systemctl enable nginx
systemctl status nginx
echo "<h1>Hello from EC2 with NGINX</h1>" > /usr/share/nginx/html/index.html