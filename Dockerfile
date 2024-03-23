FROM centos:7

LABEL author "ranjit"

RUN yum update -y

RUN yum install httpd -y

RUN echo "<h1> Hello world </h1>" > /var/www/html/index.html

RUN systemctl start httpd

RUN systemctl enable httpd 

EXPOSE 80

CMD ["httpd" "-D" "FOREGROUND"]

