FROM adoptopenjdk/openjdk11-openj9:alpine-slim

COPY hello-app/target/hello-app.jar /opt/app.jar

ENTRYPOINT java $JAVA_OPTS -Xshareclasses -Xquickstart -jar /opt/app.jar