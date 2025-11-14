FROM maven:3.8.4-openjdk-17 AS builder

WORKDIR /app

COPY . .

RUN mvn package

# Tomcat image for deployment

FROM tomcat:10.1-jdk17

WORKDIR /usr/local/tomcat/webapps

# Copy the built WAR file from the Maven builder stage to the Tomcat webapps directory
COPY --from=builder /app/webapp/target/*.war .

EXPOSE 8080

# Command to run Tomcat
CMD ["catalina.sh", "run"]
