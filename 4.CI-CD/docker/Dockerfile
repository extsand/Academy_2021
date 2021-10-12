## Will fix with apache2 / httpd
# full ubuntu image don't neccessary
# We can use only aimed images for our purpose
# example
#FROM httpd:2.4 
##

# EXAMPLE
# Dockerfile Ubuntu/Apache
FROM ubuntu
MAINTAINER Extsand <extsand@extsand.com>

RUN apt-get update \
		&& apt-get install apache2 \
		&& apt-get install tree
COPY ./page.app /var/www/html/
EXPOSE 5000
CMD [ "sudo service apache2 restart"]

#=========================================================


# Dockerfile Apache
FROM httpd:2.4
COPY ./page.app /usr/local/apache2/htdocs
EXPOSE 80
#CMD [ ""]

#=========================================================


#Dockerfile Alpine/Python
#load base image from dockerhub
FROM alpine:3.5

#install python and pip to base image
#upgrade pip
RUN apk add --update py2-pip \
		&& pip install --upgrade pip

#install Python modules for The Python App
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

#copy all files for The Python App to run
# . - all files from app folder
COPY . /usr/src/app/


#copy files for The Python App to run
#copy each file from app folder
# COPY app.py /usr/src/app/

# COPY templates/index.html /usr/src/app/templates/
# COPY templates/about.html /usr/src/app/templates/
# COPY templates/layout.html /usr/src/app/templates/

# COPY static/css/style.css /usr/src/app/static/css/style.css
# COPY static/css/style.css.map /usr/src/app/static/css/style.css.map
# COPY static/css/img/bg.jpg /usr/src/app/static/css/img/bg.jpg

# COPY static/js/script.js /usr/src/app/static/js/script.js

#set port number for the container should expose
EXPOSE 5000

#run The Python 
CMD ["python", "/usr/src/app/app.py"]


#=========================================================

FROM alpine:3.11

WORKDIR /usr/src/app
#file to .
COPY requirements.txt .
#all files to .
COPY . .


RUN apk add --no-cache python3 py3-pip \
		&& pip3 install --upgrade pip \
		&& pip3 install --no-cache-dir -r /usr/src/app/requirements.txt

EXPOSE 5000
CMD ["python3", "run.py"]

	




