FROM openjdk:14-jdk-alpine 
ADD target/*.jar application.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/application.jar"]
