FROM ubuntu:latest
MAINTAINER arpitaggarwal "aggarwalarpit.89@gmail.com"
RUN apt-get -y update
RUN apt-get -q -y install git
RUN sudo apt-get install -y ruby
RUN apt-get install -y ruby-dev
RUN apt-get -y update
RUN apt-get install -y make
RUN apt-get install -y build-essential
RUN apt-get install -y puppet
RUN gem install librarian-puppet
ADD Puppetfile /
RUN librarian-puppet install
RUN puppet apply --modulepath=/modules -e "include java8 class { 'tomcat':version => '7',java_home => '/usr/lib/jvm/java-8-oracle'}"
RUN apt-get remove -y make puppet build-essential ruby-dev
COPY /spring-mysql/target/spring-mysql.war /var/lib/tomcat7/webapps/
EXPOSE 8080
