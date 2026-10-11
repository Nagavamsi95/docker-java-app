# ---------- Stage 1: build the WAR with Maven ----------
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app

# Copy pom.xml first so Docker can cache the dependency download
COPY pom.xml .
RUN mvn -B dependency:go-offline

# Copy the source code and build the WAR
COPY src ./src
RUN mvn -B clean package

# ---------- Stage 2: run it on Tomcat ----------
FROM tomcat:9.0-jdk17-temurin

# Remove the default Tomcat sample apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy only the finished WAR from stage 1
COPY --from=build /app/target/java-my-webapp.war /usr/local/tomcat/webapps/java-my-webapp.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
