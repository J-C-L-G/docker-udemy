#!/bin/sh
# To download (if required) and use the node image from docker hub
docker run node

# Tow see the containers created ps stands for processes
docker ps -a

# to expose the node Repl in the container (interactive session to hosting machine)
docker run -it node

