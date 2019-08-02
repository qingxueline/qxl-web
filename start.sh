#!/bin/bash
export BUILD_ID=dontKillMe
JAR_NAME='qxl-web.jar'
JAR_FILE=~/.jenkins/workspace/qxl-web/target/$JAR_NAME
if [ ! -f "$JAR_FILE" ]; then
  exit
else
  cp $JAR_FILE ~/qxl-web/$JAR_NAME
fi

cd ~/qxl-web/ || exit
pwd

echo "Startup SpringBoot Application"
#nohup java -javaXms128m -Xmx256m -jar -Dfile.encoding=utf-8 ${JAR_NAME} &
nohup java -jar ${JAR_NAME} >consoleMsg.log 2>&1 &
#pid='ps -ef | grep '${JAR_NAME}' |  grep -v grep | awk '{print $2}''
#if [ -n "$pid" ]
#then
#   kill -9 $pid
#fi
