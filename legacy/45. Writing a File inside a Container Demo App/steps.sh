#!/bin/sh

# We first build the Docker file by checking the application
# code, ports, etc and we build the image:
docker build --tag demo-app .

# We can verify the image created:
docker images

# REPOSITORY                    TAG                 IMAGE ID            CREATED             SIZE
# demo-app                      latest              de227e2e01ce        10 seconds ago      940MB

# Then once the image is created we can run as:
docker run -p 3000:80 --name demo-app-container demo-app

# And the container should be running port 3000 on local machine:
# CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                  NAMES
# 324b981cd235        demo-app            "docker-entrypoint.s…"   7 seconds ago       Up 6 seconds        0.0.0.0:3000->80/tcp   demo-app-container

# NOTE: The downside of this way of persisting data is that it if you run with -rm as soon as the container is removed,
# your feedback files will be removed along with it.
