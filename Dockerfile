# Build stage
FROM maven:3.9.6-amazoncorretto-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Run stage
FROM amazoncorretto:21-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

# Optional: Add wait-for-it script if you need to wait for other services
# COPY wait-for-it.sh .
# RUN chmod +x wait-for-it.sh

EXPOSE 8080

# Java 21 specific options
ENV JAVA_OPTS="\
    -XX:+UseParallelGC \
    -XX:MaxRAMPercentage=75 \
    --enable-preview"

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]