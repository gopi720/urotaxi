FROM ubuntu:20.04

RUN mkdir -p /u01/applications
RUN apt update -y
RUN apt install -y openjdk-11-jdk

EXPOSE 8082

WORKDIR /u01/applications
COPY target/urotaxi-1.0.jar .
ENTRYPOINT [ "java", "-jar", "./urotaxi-1.0.jar" ]