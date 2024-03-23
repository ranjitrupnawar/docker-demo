FROM centos:7

LABEL author "ranjit"

ADD  curl -O https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.99/bin/apache-tomcat-8.5.99.tar.gz

RUN tar -xvf apache-tomcat-8.5.99.tar.gz -C /opt

RUN cd /opt/apache-tomcat-8.5.99

EXPOSE 8080

CMD ["catalina.sh" "run"]

