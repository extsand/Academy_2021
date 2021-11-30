#!/bin/bash
#Sometimes we need add Env 
export BOT_API_KEY="botexampleapicod"

#Create jar package
mvn package
mvn install -D skipTests
mvn package -e


#depack 
jar xf oracle.jar oracle/
#creat file inside jar
jar cf oracle.jar add_me
#pack
jar cfv oracle.jar oracle/


#notes for springboot 
#confirure
logging.level.org.springframework.web: trace
logging.level.org.apache: trace


#tomcat
# http://www.herongyang.com/JSP/Tomcat-My-First-HTML-Page.html
docker run -it -p 80:8080 tomcat:latest