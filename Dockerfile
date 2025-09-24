# Step 1: Build jar using Maven
FROM maven:3.9.2-jdk-17 AS build

WORKDIR /app

# Copy pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source code
COPY src ./src

# Build the jar
RUN mvn clean package -DskipTests

# Step 2: Run jar using lightweight JDK
FROM openjdk:17-alpine

WORKDIR /app

COPY --from=build /app/target/studmgmt.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]
