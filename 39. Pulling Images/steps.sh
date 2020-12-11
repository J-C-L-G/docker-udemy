#!/bin/sh

# Since the image was pushed as public, we dont have to be authenticated in order to download it
# we can make reference to the repository that we created
docker pull jclgps/hello-world-node-app:latest

# And this way when we list the images we can see the image that was pulled from docker hub
# REPOSITORY                    TAG                 IMAGE ID            CREATED             SIZE
# jclgps/hello-world-node-app   latest              49ae74666b4e        18 hours ago        939MB <====== pulled!
# node                          latest              2d840844f8e7        2 weeks ago         935MB

# Now we can run the image in a container as
docker run -p 3000:80 --rm jclgps/hello-world-node-app

# We can also directly run using an image reference this way if is not locally installed it will try to pull it
# and then run it, however if after it was initially pulled there is an update, if you run again it wont fetch
# before execute it, you will have to pull it again to make sure you have the latest version (if needed).
docker run -p 3000:80 --rm jclgps/hello-world-node-app




