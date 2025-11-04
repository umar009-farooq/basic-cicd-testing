FROM maven:3.9.6-amazoncorretto-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the JAR
FROM openjdk:17
WORKDIR /app
COPY ./target/basic-cicd-testing-0.0.1-SNAPSHOT.jar /app/basic-cicd-testing.jar
EXPOSE 8080
CMD ["java", "-jar", "basic-cicd-testing.jar"]
