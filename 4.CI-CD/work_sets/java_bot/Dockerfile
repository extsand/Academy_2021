FROM openjdk:17-jdk-alpine

#Fast guide:
# how to build app:
# docker build -t 'app_name:0.1' .

#how to run container:
#docker run -it -p 18080:18080 app_name:0.1

#example usage some commands:
# docker build --build-arg telegram_bot_token=$(TELEGRAM_bot_token) -t $(app_image_name) ./.

#example env and local var
# ARG telegram_bot_token
# ENV TELEGRAM_bot_token=$telegram_bot_token

# Example for hook
# ENV WEBHOOK_LINK=https://api.telegram.org/bot$BOT_TOKEN/setWebhook?url=$LOAD_BALANCER_LINK


# load balancer to telegram
ARG app_webhook_link
ARG app_bot_username
ARG app_bot_token

ENV APP_WEBHOOK_LINK=$app_webhook_link
ENV APP_BOT_USERNAME=$app_bot_username
ENV APP_BOT_TOKEN=$app_bot_token


#all files to . 
# COPY . .
RUN env | grep "APP"

COPY target/webhook-bot-0.0.1-SNAPSHOT.jar webhook-bot-0.0.1-SNAPSHOT.jar

# Strange command... not sure about it, but we should try with real LBs
# RUN curl https://api.telegram.org/bot$BOT_TOKEN/setWebhook?url=$LOAD_BALANCER_LINK
# curl https://api.telegram.org/bot2145180222:AAFmFJnIzdeJpbMd24Yf02srsHj6L_Edt9o/setWebhook?url=13.48.59.7

#run app - working method. I tested it.
ENTRYPOINT ["java","-jar","/webhook-bot-0.0.1-SNAPSHOT.jar"]
#port app
# EXPOSE 
EXPOSE 8080

