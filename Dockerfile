FROM openjdk:14-jdk-alpine 
RUN git clone https://github.com/ambientiaoy/challenge-api.git
ADD target/*.jar application.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/application.jar"]
