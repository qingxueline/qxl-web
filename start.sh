#!/bin/bash
JAR_NAME='qxl-web.jar'
pwd
cd target
nohup java -javaXms128m -Xmx256m -jar -Dfile.encoding=utf-8 ${JAR_NAME} &