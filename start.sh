#!/bin/bash
JAR_NAME='qxl-web.jar'
cd ~/.jenkins/workspace/qxl-web/target || exit
pwd
#nohup java -javaXms128m -Xmx256m -jar -Dfile.encoding=utf-8 ${JAR_NAME} &
nohup java -jar ${JAR_NAME} >consoleMsg.log 2>&1 &
#pid='ps -ef | grep '${JAR_NAME}' |  grep -v grep | awk '{print $2}''