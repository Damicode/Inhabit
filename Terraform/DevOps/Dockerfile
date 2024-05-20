FROM openjdk:17-jdk-alpine
MAINTAINER damier
ARG JAR_FILE=Inhabit/webApp/target/*.jar
COPY ${JAR_FILE} inhabit.jar
ENTRYPOINT ["java","-jar","/inhabit.jar"]