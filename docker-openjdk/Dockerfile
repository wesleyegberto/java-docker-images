FROM openjdk:11-jre

COPY hello-app/target/hello-app.jar /opt/app.jar

ENTRYPOINT java -Djava.security.egd=file:/dev/./urandom -jar /opt/app.jar