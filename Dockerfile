# Step 1: Use Maven image to build the jar
FROM maven:3.9.2-eclipse-temurin-17 AS build

WORKDIR /app

# Copy pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source code
COPY src ./src

# Build the application (skip tests)
RUN mvn clean package -DskipTests

# Step 2: Use lightweight JDK to run the app
FROM openjdk:17-alpine

WORKDIR /app

# Copy the jar from build stage (adjusted to finalName)
COPY --from=build /app/target/studmgmt.jar app.jar

# Expose the port
EXPOSE 8080

# Run the jar
ENTRYPOINT ["java","-jar","app.jar"]
