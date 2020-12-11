#!/bin/sh

# Sharing images from Docker hub or Private Registry

# First step would be create an account in docker hub or any other image registry
# https://hub.docker.com/


# Now we can login in docker using our credentials
docker login


# Now we can use the repository name that we created in docker hub to push our images
# but first we need to tag the image to the corresponding repository
# if we already have an existing image we can creat a re-tagged clone

# If we execute docker images
# REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
# <none>              <none>              49ae74666b4e        17 hours ago        939MB
# node                latest              2d840844f8e7        2 weeks ago         935MB


# We will tag image "49ae74666b4e" to a new repository
docker tag 49ae74666b4e jclgps/hello-world-node-app:latest

# This will update the image details as:
# REPOSITORY                    TAG                 IMAGE ID            CREATED             SIZE
# jclgps/hello-world-node-app   latest              49ae74666b4e        17 hours ago        939MB
# node                          latest              2d840844f8e7        2 weeks ago         935MB


# NOTE: When we use the id the image will be updated, if we use an existing tag, the image will get cloned
# so we will keep the existing one and the updated image that was recently cloned
docker tag jclgps/hello-world-node-app:latest newtag


# This will clone and bring a new image
# REPOSITORY                    TAG                 IMAGE ID            CREATED             SIZE
# jclgps/hello-world-node-app   latest              49ae74666b4e        17 hours ago        939MB
# newtag                        latest              49ae74666b4e        17 hours ago        939MB <====== Cloned!
# node                          latest              2d840844f8e7        2 weeks ago         935MB


# With a image tagged as we expect for our repository, in this case "jclgps/hello-world-node-app:latest"
# we can proceed and push this image to the docker hub registry
docker push jclgps/hello-world-node-app:latest



