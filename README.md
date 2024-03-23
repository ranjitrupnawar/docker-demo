application hellow world on node jd
Dockerfile content -->>
# Use the official Node.js image
FROM node:14-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

RUN npm cache clean --force


# Install dependencies
RUN npm install

# Copy application code
COPY . .

# Expose port 3000
EXPOSE 3000

# Command to run the application
CMD ["node", "app.js"]
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
another files near Dockerfile with same location 
name file app.js
content ==>>
const http = require('http');

const hostname = '0.0.0.0';
const port = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello, World!\n');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
-----------------------------------------------------------------------------------------------------------------------------
tomcat hosting with dockerfile content-->


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
nginx hosting on dockerfile-->

FROM ubuntu

RUN apt update

RUN apt install -y unzip

RUN apt install -y nginx

ADD https://www.free-css.com/assets/files/free-css-templates/download/page293/chocolux.zip .

RUN unzip chocolux.zip

RUN cp chocolux-html /usr/share/nginx/html/index.html

RUN systemctl enable nginx

RUN systemctl start nginx

EXPOSE 80

CMD [ "nginx","-D", "FOREGROUND" ]

