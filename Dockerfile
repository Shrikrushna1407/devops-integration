#Starts with base image conatining the java runtime
FROM openjdk:21-jdk-slim
#Adds the applications jar to the docker image
COPY target/myfirstapplication-0.0.1-SNAPSHOT.jar myfirstapplication-0.0.1-SNAPSHOT.jar
#Command to execute my application
ENTRYPOINT ["java","-jar","myfirstapplication-0.0.1-SNAPSHOT.jar"]