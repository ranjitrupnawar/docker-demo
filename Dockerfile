FROM centos:7

LABEL author "ranjit"

ADD  https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.99/bin/apache-tomcat-8.5.99.tar.gz .

RUN tar -xvf apache-tomcat-8.5.99.tar.gz -C /opt


RUN yum install -y epel-release

RUN yum install -y java-11-openjdk-devel

WORKDIR /opt/apache-tomcat-8.5.99/webapps/

ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war .


EXPOSE 8080

CMD ["/opt/apache-tomcat-8.5.99/bin/catalina.sh", "run"]

#----------------------------------------------------------------

FROM ubuntu

RUN apt update

RUN apt install -y unzip

RUN apt install -y nginx

ADD https://www.free-css.com/assets/files/free-css-templates/download/page293/chocolux.zip .

RUN unzip chocolux.zip

RUN cp chocolux /usr/share/nginx/html/

RUN systemctl enable nginx

RUN systemctl start nginx

EXPOSE 80

CMD [ "nginx","-D" "FOREGROUND" ]
