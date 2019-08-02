#!/bin/bash
JAR_NAME='qxl-web'
#cd ~/.jenkins/workspace/qxl-web/target
cd ~/.jenkins/workspace/qxl-web/D:/JAR-Target/web-api
pwd
#nohup java -javaXms128m -Xmx256m -jar -Dfile.encoding=utf-8 ${JAR_NAME} &
nohup java -jar ${JAR_NAME}.jar >consoleMsg.log 2>&1 &
#pid='ps -ef | grep '${JAR_NAME}' |  grep -v grep | awk '{print $2}''