#!/bin/sh

# When we start a stopped container, that container will be running in the background, compared to when we execute
# "docker run [image:id/name]" this start the container in the foreground and blocks the terminal from where it was started.
# The default is docker run -> attached mode  while for docker start => detach mode (this can be configured)

# When a container is running in attached mode we can see and listen for the container output, sort of the output stream
# is the terminal where the container is running.


# Run a container in detach mode (contrary to the default setting) we pass the "-d" flag
# this will start the container while not listening or blocking the terminal
docker run -p 9000:80 -d d6b00394528f


# If at a later point you need to attach to a running container, we can execute:
docker container attach [container:id/name]
docker container attach 83c0710a4f73


# When we want to get access to a container output running in detach mode, we can also execute the logs command
docker logs [container:id/name]
docker logs 3da75be0e685


# If we want to retrieve existing logs and keep listening for them (getting attached to it) we can use the -f flag.
docker logs 3da75be0e685 -f


# Finally when we want to start a stopped container (which by default start in detach mode) we can send the -a flag
docker start [container:id/name] -a
docker start 83c0710a4f73 -a

