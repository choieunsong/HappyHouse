FROM openjdk:8
ARG JAR_FILE=target/*.war
COPY ${JAR_FILE} app.war
EXPOSE 9090
ENTRYPOINT ["java", "-jar", "/app.war"]

