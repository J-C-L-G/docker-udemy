#!/bin/sh

# Volumes are folder on the host machine (the one running docker container) that are mounted and mapped
# to the running container, a volume is persisted after container is stopped, restarted, a container can
# read from and write to a volume.

# First we will create a volume not mapped to the local machine
# (this type of volume gets removed when the container is deleted)
# VOLUME [ "/app/feedback" ]
docker build -t demo-app:non-named-volume .

# Then we run the container:
docker run -d --name demo-app-container-volume -p 3000:80 --rm  demo-app:non-named-volume

# The container will stop, we can see the logs with:
docker logs demo-app-container-volume

# The code is interacting with the File System in a way is causing issues:
# node:internal/process/promises:225
#           triggerUncaughtException(err, true /* fromPromise */);
#           ^
#
# [Error: EXDEV: cross-device link not permitted, rename '/app/temp/test.txt' -> '/app/feedback/test.txt'] {
#   errno: -18,
#   code: 'EXDEV',
#   syscall: 'rename',
#   path: '/app/temp/test.txt',
#   dest: '/app/feedback/test.txt'
# }

# We will change the code from:
#       await fs.rename(tempFilePath, finalFilePath);
# To:
#       await fs.copyFile(tempFilePath, finalFilePath);
#       await fs.unlink(tempFilePath);

# Rebuild image and container:
# If we stop and start now the container keeps the files as long as the container is not removed
# (the volume remains in the machine, we can use "docker volume ls"), we will change this
# limitation with a named volume, this is the volume structure when is not directly mapped to a local host directory:
#
# "Mounts": [
#     {
#         "Type": "volume",
#         "Name": "d618aa07b08ca61192ba6dc42faed27b95eae5fddac477283a0fb35769b785e1",
#         "Source": "/var/lib/docker/volumes/d618aa07b08ca61192ba6dc42faed27b95eae5fddac477283a0fb35769b785e1/_data",
#         "Destination": "/app/feedback",
#         "Driver": "local",
#         "Mode": "",
#         "RW": true,
#         "Propagation": ""
#     }
# ]

# We can list existing volumes with
docker volume ls

# DRIVER    VOLUME NAME
# local     d618aa07b08ca61192ba6dc42faed27b95eae5fddac477283a0fb35769b785e1

# We can inspect the volume with:
docker volume inspect d618aa07b08ca61192ba6dc42faed27b95eae5fddac477283a0fb35769b785e1

# [
#     {
#         "CreatedAt": "2020-12-17T00:40:52Z",
#         "Driver": "local",
#         "Labels": null,
#         "Mountpoint": "/var/lib/docker/volumes/d618aa07b08ca61192ba6dc42faed27b95eae5fddac477283a0fb35769b785e1/_data",
#         "Name": "d618aa07b08ca61192ba6dc42faed27b95eae5fddac477283a0fb35769b785e1",
#         "Options": null,
#         "Scope": "local"
#     }
# ]

# NOTE: Volumes are never deleted unless the parent container is deleted with "docker rm -v container_id"
# and there are no other containers using the volume.

# We can clean up the volumes
docker volume -h
docker volume prune



