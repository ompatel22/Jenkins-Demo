FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app
COPY src/ .
RUN javac Main.java
CMD ["java", "Main"]
