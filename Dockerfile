FROM openjdk:21

WORKDIR /app

COPY ./target/dockerizando-0.0.1-SNAPSHOT.jar .

ENTRYPOINT ["java", "-jar", "dockerizando-0.0.1-SNAPSHOT.jar"]