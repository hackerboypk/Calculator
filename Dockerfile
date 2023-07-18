FROM tomcat:latest
LABEL maintainer="Pawan Kahurke"
ADD ./target/Calculator-1.0-SNAPSHOT.jar /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
