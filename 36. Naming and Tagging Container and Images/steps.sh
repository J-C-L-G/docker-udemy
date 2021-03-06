#!/bin/sh

# We can assign a name to a container (instead of the autogenerated) when we run if we pass the --name flag
docker run --name my_container [image:id/name]

# When we build images we can also provide a "tag" (similar to a name in the container) to have a better control
# The tag consists of 2 parts [repository:tag] for example NODE image the repository is "node" and tag is "latest"
# REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
# node                latest              2d840844f8e7        2 weeks ago         935MB


# These 2 values combined will give you a unique identifier
docker build -t my_image:latest .

# If you want to remove all images including those which were tagged
docker image prune -a
