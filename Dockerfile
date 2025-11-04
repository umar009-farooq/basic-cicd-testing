# Stage 1: Build
FROM maven:3.9.9-amazoncorretto-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run
FROM amazoncorretto:17
WORKDIR /app
COPY --from=build /app/target/basic-cicd-testing-0.0.1-SNAPSHOT.jar /app/basic-cicd-testing.jar
EXPOSE 8080
CMD ["java", "-jar", "basic-cicd-testing.jar"]
