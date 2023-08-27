#!/bin/sh

# Docker provides the "cp" command that stand for copy, it allows to copy files from and to a container
docker cp [local_path] [container:id/name]:[container_path]
docker cp test/. 6a492f3147d0:/test

# Now after we copy we can get the file from the container as, this will create a new folder in local with the files
# that previously we copied into the container from our local machine.
docker cp [container:id/name]:[container_path] [local_path]
docker cp 6a492f3147d0:/test ./test_from_container

# NOTE: these are useful to change content of a container (like source code) and while avoiding the step to rebuild the
# image and then re run the container, there are better ways to handle this but this is a possible option.
