#!/bin/sh

# To create our image from the local Docker file
docker build .

# to run the generated image using the id returned from the docker build command
# docker run [image:id]
docker run d6b00394528f4c1bfbef4f92fbc9ac30eea96d0c97501b9a24b95e767e39fb13

# Since the container was running but the exposed port was not working on the local machine we stop the container as:
# To list the container that are running
# -a flag = To list all containers else only running will be listed
docker ps

# To stop one specific container
# docker stop [imageId or name]
docker stop d70ffd9946bf

# To show the stopped container we can send the -a flag and we will see the container that we just stopped.
docker ps -a

# To indeed expose the port (80 in this case) we need to send the publish flag "-p"
# with -p "HOST_MACHINE_PORT:INTERNAL_CONTAINER_PORT" to docker
docker run -p 5000:80 d6b00394528f4c1bfbef4f92fbc9ac30eea96d0c97501b9a24b95e767e39fb13


