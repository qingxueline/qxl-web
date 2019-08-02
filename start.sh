#!/bin/bash
# 必须添加此参数，否则Jenkins在执行完一个job就会把tamcat程序杀掉，导致执行[nohup java -jar ${JAR_NAME} >consoleMsg.log 2>&1 &]起不来
export BUILD_ID=dontKillMe
# 常量定义
JAR_NAME="qxl-web.jar"
JAR_FILE=~/.jenkins/workspace/qxl-web/target/${JAR_NAME}
execute_target=~/qxl-web/

# 判断是否已有启动的程序
pid='ps -ef | grep '${JAR_NAME}' |  grep -v grep | awk '{print $2}''
echo $pid
if [ -n $pid ]
then
   kill -9 $pid
fi

# 对文件和文件路径进行判断
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

# 执行新程序
cd ~/qxl-web/ || exit
echo "Go to the execution directory >> $(pwd)"
echo "Startup SpringBoot Application"
nohup java -jar ${JAR_NAME} >consoleMsg.log 2>&1 &
