FROM openjdk:14-jdk-alpine 
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

RUN git clone https://github.com/ambientiaoy/challenge-api.git
WORKDIR challenge-api/target
ADD target/*.jar application.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/application.jar"]
