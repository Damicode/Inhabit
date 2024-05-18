FROM openjdk:17-jdk-alpine
MAINTAINER damier
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} inhabit.jar
ENTRYPOINT ["java","-jar","/inhabit.jar"]