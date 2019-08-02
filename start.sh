#!/bin/bash
JAR_NAME='qxl-web.jar'
cd ~/.jenkins/workspace/qxl-web/target
pwd
#nohup java -javaXms128m -Xmx256m -jar -Dfile.encoding=utf-8 ${JAR_NAME} &
nohup java -jar ${JAR_NAME} >consoleMsg.log 2>&1 &