#!/bin/sh

# To show help options we can use:
docker --help

# At the same time we can bring additional information of one command by sending the -h flag to it
docker ps --help
docker run --help

# Restarting a stopped container, when we execute "docker run ..." we create a start a new container, but we can also
# restart a container that was stopped before (probably nothing changed in the app so there is no need to create and
# and run a new container
docker ps -a

# Using the container id we can start the container
docker start [container:id/name]
docker start b28fe059e61c

# Now the container should be up and running (in detached mode, compared when we run first time and blocks the terminal)
docker ps

# And to stop it we can simply execute
docker stop [container:id/name]
docker stop b28fe059e61c













