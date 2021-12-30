FROM maven:3.6.1-jdk-8-alpine AS MAVEN_BUILD
WORKDIR /spring/backend

COPY ./ ./
RUN mvn clean package

FROM openjdk:8-jre-alpine3.9
COPY --from=MAVEN_BUILD /spring/backend/target/*.jar /app.jar
CMD ["java","-jar","/app.jar"]

