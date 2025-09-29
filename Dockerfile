# Step 1: Use a lightweight JDK base image
FROM eclipse-temurin:17-jdk-jammy

# Set working directory inside the container
WORKDIR /app

# Copy the built JAR file from Jenkins workspace to the container
# Assuming Jenkins pipeline runs './mvnw clean package -DskipTests' beforehand
COPY target/*.jar app.jar

# Expose application port (change if required)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
