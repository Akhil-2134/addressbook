FROM ubuntu:22.02 AS build
RUN apt-get update && apt-get install -y maven git default-jdk
WORKDIR /app
COPY . /app
RUN mvn clean package


#STAGE 2

FROM tomcat:10.1-jdk21-temurin
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
