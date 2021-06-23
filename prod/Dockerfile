MAINTAINER Yevhen Khadzhamov
FROM alpine
ARG java_app


RUN apk add openjdk8-jre
RUN wget http://apache.rediris.es/tomcat/tomcat-9/v9.0.46/bin/apache-tomcat-9.0.46.tar.gz -O /tmp/tomcat9.tar.gz
RUN mkdir /opt/tomcat
RUN tar xvzf /tmp/tomcat9.tar.gz  --strip-components 1 --directory /opt/tomcat
RUN rm /tmp/tomcat9.tar.gz

WORKDIR /opt/tomcat/webapps
COPY ${java_app} .

EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
