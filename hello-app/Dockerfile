FROM docker.io/maven AS build-env

WORKDIR /app
COPY pom.xml ./

# download dependencies as specified in pom.xml
# building dependency layer early will speed up compile time when pom is unchanged
RUN mvn verify --fail-never

COPY hello-app ./

# Compile the application.
RUN mvn -Dmaven.test.skip=true package

# Build runtime image.
FROM openjdk:11-jre-alpine
WORKDIR /app

# Copy the compiled files over.
COPY --from=build-env /app/target/ /app/

# Starts java app with debugging server at port 5005.
CMD ["java", "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005,quiet=y", "-jar", "/app/hello-appjar"]
