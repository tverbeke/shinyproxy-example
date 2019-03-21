FROM openjdk:8-jre

MAINTAINER Sergio Fernández "acsdesk@protonmail.com"

RUN mkdir -p /opt/shinyproxy/
RUN wget https://www.shinyproxy.io/downloads/shinyproxy-2.1.0.jar -O /opt/shinyproxy/shinyproxy.jar
COPY application.yml /opt/shinyproxy/application.yml

WORKDIR /opt/shinyproxy/
CMD ["java", "-jar", "/opt/shinyproxy/shinyproxy.jar"]



## sudo docker network create shinyproxy-net
## sudo docker build . -t shinyproxy-example
## sudo docker run -d -v /var/run/docker.sock:/var/run/docker.sock --net shinyproxy-net -p 8080:8080 shinyproxy-example
