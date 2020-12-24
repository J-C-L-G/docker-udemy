#!/bin/sh

# We can list volumes using:
docker volume ls

# We can create a volume using:
docker volume create [:volume-name]
docker volume create test-volume

# This way we can use this new volume that we created as:
docker run -d -p 3000:80 --name demo-app-watch-container -v test-volume:/app/feedback -v ... etc

# We can inspect this volume with:
docker volume inspect test-volume

#  [
#      {
#          "CreatedAt": "2020-12-23T19:51:04Z",
#          "Driver": "local",
#          "Labels": {},
#          "Mountpoint": "/var/lib/docker/volumes/test-volume/_data",
#          "Name": "test-volume",
#          "Options": {},
#          "Scope": "local"
#      }
#  ]

# We can delete the volume using: (only possible if not being used by a container)
docker volume rm test-volume

# To remove all unused volumes we can use:
docker volume prune



