FROM livingobjects/jre8
VOLUME /tmp
ADD qxl-web.jar app.jar
RUN sh -c 'touch /app.jar'
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]