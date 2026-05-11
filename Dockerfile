FROM maven:3.9.14-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY openapi.yaml .
RUN mvn clean package -B

FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
ENTRYPOINT ["echo", "carrito-service-api contract image ready"]