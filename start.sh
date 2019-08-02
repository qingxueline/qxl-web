#!/bin/bash

export BUILD_ID=dontKillMe

JAR_NAME="qxl-web.jar"
JAR_FILE=~/.jenkins/workspace/qxl-web/target/${JAR_NAME}
execute_target=~/qxl-web/

pid=$(ps -ef | grep ${JAR_NAME} | grep -v grep | awk '{print $2}')
if [ -n "${pid}" ]; then
  echo "kill -9 pid:"${pid}
  ps -ef | grep ${JAR_NAME} | grep -v grep | awk '{print $2}' | xargs kill -9
fi

if [ ! -f ${JAR_FILE} ]; then
  echo "qxl-web.jar not exist!"
  exit
else
  if [ ! -d ${execute_target} ]; then
    echo "create directory:${execute_target}"
    mkdir -p ${execute_target}
  fi
  cp ${JAR_FILE} ~/qxl-web/${JAR_NAME}
fi

cd ~/qxl-web/ || exit
echo "Go to the execution directory >> $(pwd)"
echo "Startup SpringBoot Application"
nohup java -jar ${JAR_NAME} >consoleMsg.log 2>&1 &
