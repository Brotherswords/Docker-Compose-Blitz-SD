# Docker Compose Blitz Demo: NGINX and Flask
# Overview
This project demonstrates the use of Docker Compose to set up and run a multi-container (well really just 2 but its for the purpose of a demo) Docker application. It includes an NGINX container serving as a reverse proxy (don't worry about NGINX, just know that its job is to give static images to the Flask website) and a Flask web application container. Docker Compose facilitates the configuration, networking, and communication between these containers.

# About Docker Compose
Docker Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file (docker-compose.yml) to configure your application’s services, networks, and volumes. Then, with a single command, you create and start all the services from your configuration.

Key Features
Service Configuration: Define your application's environment with a docker-compose.yml file, so you can keep your configurations organized and easy to maintain.
Networking: Automatically sets up a network, allowing containers to communicate with each other. Inter-container communication is seamless, making it ideal for microservices architecture.
Volumes: Manage persistent data for your Docker containers.
# Project Structure
1) docker-compose.yml: The Compose file that defines the services and volumes for this project (look at it for more info on why its setup the way it is, and what each container does).
2) Dockerfile: Instructions for building the Flask app's Docker image.
3) /static: A directory containing static content to be served by NGINX.
4) /templates: A directory containing HTML templates for the Flask app.
5) app.py: The Flask application.
# Services
## NGINX
- Role: Serves as a reverse proxy, routing requests to the Flask application.
- Configuration: Defined in docker-compose.yml and uses nginx.conf for specific configurations.
- Static Files: Serves static content from the /static directory.
## Flask App
- Role: A simple web application built with Flask.
- Communication: Communicates with the NGINX service through the network defined in Docker Compose.
- Port: Internally, it listens on port 4090, as specified in docker-compose.yml but displays on the host at 4080. Make sure you know why this is true and how docker does this. 
- Inter-Container Communication: The NGINX and Flask containers communicate over a Docker-managed network, allowing NGINX to forward requests to the Flask application. This setup is defined in the docker-compose.yml file:
- The NGINX service is configured to forward requests to http://web:4090, where web is the service name of the Flask application as defined in docker-compose.yml.
- The Flask app listens on port 4090 and responds to requests, which are routed through NGINX.

# Running the Project
- To run the project, use the following command:

```docker-compose up --build```

- If you make changes and want to rebuild the project or want to take down the composed containers try:

```docker-compose down```

```docker-compose up --build```

This will build and start the containers as defined in the docker-compose.yml file.

## Accessing the Application
- Once running, the Flask application can be accessed at http://127.0.0.1:4080 (which is mapped to the port 4090 in the container).
- You should see a set of images, some text and a link if everything is working!

