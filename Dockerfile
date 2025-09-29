# Step 1: Use official OpenJDK image as base
FROM openjdk:17-slim

# Step 2: Set working directory
WORKDIR /app

# Step 3: Copy Java source code to container
COPY src/Main.java /app

# Step 4: Compile Java source code
RUN javac Main.java

# Step 5: Run the program
CMD ["java", "Main"]
