FROM eclipse-temurin:21-jre

WORKDIR /order-service

COPY target/*.jar order-service.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","order-service-1.0.jar"]