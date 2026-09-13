FROM maven:3.9.16-eclipse-temurin-21 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

FROM tomcat:10.1-jdk21

RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy the MySQL JDBC driver into Tomcat's library
COPY --from=build /root/.m2/repository/com/mysql/mysql-connector-j/9.4.0/mysql-connector-j-9.4.0.jar /usr/local/tomcat/lib/mysql-connector-j-9.4.0.jar

COPY --from=build /app/target/smartpetmanagement.war /usr/local/tomcat/webapps/ROOT.war

# Disable Tomcat shutdown port
RUN sed -i 's/port="8005"/port="-1"/' /usr/local/tomcat/conf/server.xml

EXPOSE 8080

CMD ["catalina.sh", "run"]