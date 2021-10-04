## Will fix with apache2 / httpd
# full ubuntu image don't neccessary
# We can use only aimed images for our purpose
# example
#FROM httpd:2.4


FROM ubuntu
MAINTAINER Extsand <extsand@extsand.com>

RUN apt-get update\
		&& apt-get install apache2

COPY ./page.app /var/www/html/
EXPOSE 5000

CMD [ "sudo service apache2 restart"]



