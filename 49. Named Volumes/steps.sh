#!/bin/sh

# We will create a docker managed volume with a name assigned by, this volume will remain at our reach
# even if we remove the container and start a new one making reference to the same named volume "demo-app-volume":
docker build -t demo-app:named-volume .
docker run -d --name demo-app-container-volume -p 3000:80 --rm -v demo-app-volume:/app/feedback  demo-app:named-volume

# We can list the volume & container
docker volume

# DRIVER    VOLUME NAME
# local     demo-app-volume

docker ps
# CONTAINER ID   IMAGE                   COMMAND                  CREATED          STATUS          PORTS                  NAMES
# 58ea75094acf   demo-app:named-volume   "docker-entrypoint.s…"   52 seconds ago   Up 51 seconds   0.0.0.0:3000->80/tcp   demo-app-container-volume

# if we stop the container it will get removed since we started it using "--rm"
docker stop demo-app-container-volume

# Then we start a new container "demo-app-container-volume2" making reference to the same volume:
docker run -d --name demo-app-container-volume2 -p 3000:80 --rm -v demo-app-volume:/app/feedback  demo-app:named-volume

# For this example if we hit:
http://localhost:3000/feedback/test.txt

# It will return the first feedback file that was created when we executed the first container, in this case:
# demo-app-container-volume => created the test.txt file into the volume named "demo-app-volume"
# demo-app-container-volume2 => is able to read what the first container wrote in the volume even when it was deleted

# If we delete (we started it with --rm) the second container too:
docker stop demo-app-container-volume2

# We still see the named volume and can be used by mapping it to another container:
docker volume ls

# DRIVER    VOLUME NAME
# local     demo-app-volume

# NOTE: Volumes are useful when we need to persist data that we are not directly interacting with or editing,
# this will not help us to run for development purposes, we will need bind mounts for this purpose.
