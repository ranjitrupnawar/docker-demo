FROM ubuntu

LABEL = author "ranjit"

RUN apt update

RUN apt install httpd -y

RUN echo "<h1> Hello world </h1>" > /var/www/html/index.html

RUN systemctl start httpd

RUN systemctl enable httpd 

EXPOSE 80

CMD httpd -DFOREGROUND

