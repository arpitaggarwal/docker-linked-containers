FROM ubuntu:latest
MAINTAINER arpitaggarwal "aggarwalarpit.89@gmail.com"
RUN apt-get install -q -y mysql-server
RUN apt-get install -q -y mysql-client
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
EXPOSE 3306
