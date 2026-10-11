# Dockerized Java Web App (GitHub Actions + Docker Hub)

A Maven Java web app packaged as a Docker image with a multi-stage Dockerfile
(Maven build stage, Tomcat runtime stage). GitHub Actions builds the image and
pushes it to Docker Hub on every push to main.

Run it:

    docker run -d -p 8080:8080 kolakani8464/java-tomcat-app:latest

Open http://localhost:8080/java-my-webapp/hello
