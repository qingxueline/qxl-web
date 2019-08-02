#!/bin/bash
# 必须定义，如果不定义jenkins会在一个job执行完成后将tomcat程序杀死，造成程序无法再启动
export BUILD_ID=dontKillMe
# 定义变量
JAR_NAME="qxl-web.jar"
JAR_FILE=~/.jenkins/workspace/qxl-web/target/${JAR_NAME}
execute_target=~/qxl-web/
# 在部署前杀死上一次的程序
pid=$(ps -ef | grep ${JAR_NAME} | grep -v grep | awk '{print $2}')
if [ -n "${pid}" ]; then
  echo "kill -9 pid:"${pid}
  # grep ${JAR_NAME}    查询一个程序
  # grep -v grep 去除    grep
  # awk '{print $2}'    获取第二列数据
  # xargs kill -9       xargs可以将返回的数据传到给下一个命令使用
  ps -ef | grep ${JAR_NAME} | grep -v grep | awk '{print $2}' | xargs kill -9
fi
# 判定目录和文件是否存在
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
# 部署新的程序
cd ~/qxl-web/ || exit
echo "Go to the execution directory >> $(pwd)"
echo "Startup SpringBoot Application"
nohup java -jar ${JAR_NAME} >consoleMsg.log 2>&1 &
