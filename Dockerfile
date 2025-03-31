FROM tomcat:10.1.15-jdk21
LABEL author=ethans
RUN apt-get update -y
COPY webapp/target/webapp.war /usr/local/tomcat/webapps/