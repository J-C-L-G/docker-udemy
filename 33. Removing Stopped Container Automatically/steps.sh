#!/bin/sh

# If we list the "docker run --help" we can find the -rm flag which means
# "Remove container when it exists"
docker run [container:id/name] -rm

# If we stp the container
docker stop [container:id/name]

# The container wont be listed since it was removed when we stopped it.
docker ps -a
