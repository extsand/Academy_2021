# More about Makefile
# https://guides.hexlet.io/makefile-as-task-runner/
# https://makefiletutorial.com/
# 
# Run example:
# export TELEGRAM_bot_token="sample:sample1234567890"
# make local-build TELEGRAM_bot_token=$TELEGRAM_bot_token

#VAR = value - required variable
#VAR ?= value - optional variable
# you can set optional var like arg 
## example: 
## make build-app APP_NAME=example

AWS_REPOSITORY_NAME ?= devops
#app variables
APP_NAME ?= example-java-bot
ENV_NAME ?= dev
APP_TAG ?= init
APP_IMAGE = $(AWS_REPOSITORY_NAME):$(APP_TAG)

#local var
LOCAL_PORT ?= 80

#APP_WEBHOOK_LINK = https://telegrambotsimpl.herokuapp.com/
APP_LOADBALANCER_LINK = https://jbot.devops-academy-kh.click/
APP_BOT_USERNAME = @name_bot
APP_BOT_TOKEN = 12345678:botapikeyexample

.PHONY: build-app
build-app:
	$(MAKE) create-app
	echo "Build task started"
	docker build --build-arg app_webhook_link=$(APP_LOADBALANCER_LINK)\
				 --build-arg app_bot_username=$(APP_BOT_USERNAME)\
				 --build-arg app_bot_token=$(APP_BOT_TOKEN)\
				 -t $(APP_IMAGE) .
	docker run -it -p 80:8080 $(APP_IMAGE)
	echo "------ All task is done -------"


.PHONY: create-app
create-app:
	echo "Create Java app"
	mvn package
  
  
.PHONY: local-run
local-run:
	docker run -it -p $(LOCAL_PORT):5000 $(APP_IMAGE)

.PHONY: local-entrance
local-entrance:
	echo "local run and enter for docker container"
	docker exec -it $(shell docker ps | awk 'FNR == 2 {print $$1}') /bin/ash

