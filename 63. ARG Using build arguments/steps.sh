#!/bin/sh

# Useful to build images with different values without having to modify the Docker file, these values
# are not available ar runtime (unless forwarded using ENV var) and also can't be used in all commands
# in the Docker file (e.g. CWD)

docker build --tag demo-app:arg --build-arg DEFAULT_PORT=5000 .

# While checking history:

# IMAGE          CREATED             CREATED BY                                      SIZE      COMMENT
# 7a30b68909df   5 seconds ago       CMD ["npm" "start"]                             0B        buildkit.dockerfile.v0
# <missing>      5 seconds ago       COPY ./demo-app . # buildkit                    4.02kB    buildkit.dockerfile.v0
# <missing>      5 seconds ago       RUN |1 DEFAULT_PORT=5000 /bin/sh -c npm inst…   4.59MB    buildkit.dockerfile.v0
# <missing>      About an hour ago   COPY ./demo-app/package.json . # buildkit       310B      buildkit.dockerfile.v0
# <missing>      About an hour ago   EXPOSE map[5000/tcp:{}]                         0B        buildkit.dockerfile.v0
# <missing>      About an hour ago   ENV PORT=5000                                   0B        buildkit.dockerfile.v0
# <missing>      About an hour ago   ARG DEFAULT_PORT=80                             0B        buildkit.dockerfile.v0
