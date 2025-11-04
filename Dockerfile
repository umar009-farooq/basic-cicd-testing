FROM openjdk:17
WORKDIR /app
COPY ./target/basic-cicd-testing.jar /app/
EXPOSE 8080
CMD ["java", "-jar", "basic-cicd-testing.jar"]
