FROM openjdk:8-jre-alpine

COPY staging/*.jar /backend.jar

EXPOSE 9000 9001

ENTRYPOINT java -jar -Dspring.profiles.active=PROD /backend.jar
