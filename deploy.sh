#!/usr/bin/env sh
# throw error
set -e
# build
./mvnw clean package
git add -A
git commit -m 'deploy'
# 如果发布到 https://<USERNAME>.github.io
git push -f http://192.168.98.101:7777/acc/qxl-web.git master