FROM ubuntu:20.04 AS build
RUN apt update
RUN apt install openjdk-8-jdk -y
RUN apt install maven git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR ./boxfuse-sample-java-war-hello
RUN mvn package
FROM tomcat:9-jre11
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps/ROOT.war
