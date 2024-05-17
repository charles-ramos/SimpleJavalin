FROM eclipse-temurin:22-alpine

RUN apk add --update maven

COPY . /example
WORKDIR /example

RUN mvn clean package
RUN cp target/SimpleJavalin-1.0-SNAPSHOT.jar /app.jar

RUN apk add --update gcompat
# The server will listen on this port.
EXPOSE 9443
ENTRYPOINT ["java", "-jar", "/app.jar"]