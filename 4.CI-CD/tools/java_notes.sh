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
# https://howtodoinjava.com/spring-boot/spring-boot-ssl-https-example/
#confirure
logging.level.org.springframework.web: trace
logging.level.org.apache: trace


#Tomcat
#tomcat settings for aws
# https://willwarren.com/2014/01/27/running-apache-tomcat-with-ssl-behind-amazon-elb/
#simple page for tomcat
# http://www.herongyang.com/JSP/Tomcat-My-First-HTML-Page.html
docker run -it -p 80:8080 tomcat:latest
#tricks with 443-80
# https://stackoverflow.com/questions/53474735/tomcat-8080-behind-aws-application-load-balancer-443