#See more example in
# https://github.com/extsand/little_docker

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