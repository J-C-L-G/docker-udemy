#!/bin/sh

# We can get the list of the container running
docker ps

# Or the list of all container (included stopped) using:
docker ps -a

# When deleting a container first we stop the container (if is running)
docker stop [container:id/name]

# And then we can delete it using
docker rm [container:is/name]

# Removing more than one we can also send additional name(s) / id(s)
docker rm container-one container-two container-three

# Or all at once
docker container prune

# To list images we can execute
docker images

# If we want to remove one or more images we can execute:
# NOTE: As long as there are not containers either stopped or running, else first the container has to be removed.
docker rmi [image:id/name]
docker rmi [image1:id/name] [image2:id/name] [image3:id/name] [image4:id/name]

# If we want to remove all images not being used by containers we can execute
docker image prune



