#!/bin/sh

# First we will expose the PORT env variable using the "--env" or "-e" to make the value available to the
# Docker file "ENV PORT" when we run the container.
# ENV variables will be available in Docker file and in the application:
# Node => const { PORT } = process.env;

# First we build the image that will support to inject -env value
docker build . --tag demo-app:env


# We can run and inject the value using the --env flag
docker run -p 5000:9000 --env PORT=9000 demo-app:env

# Application is running on http://localhost:5000 using our dynamic port


# ..:: Using ENV files ::..
# We can also specify a ENV file where we have all the values that we want to send instead of multiple
# --env ONE=1 -e TWO=2 statements in the cli

docker run -p 5000:9000 --env-file ./.env demo-app:env


# Image history, we can see the ENV values for the image using
docker history demo-app:env

# IMAGE          CREATED          CREATED BY                                      SIZE      COMMENT
# 019bf0569af0   15 minutes ago   CMD ["npm" "start"]                             0B        buildkit.dockerfile.v0
# <missing>      15 minutes ago   COPY ./demo-app . # buildkit                    4.02kB    buildkit.dockerfile.v0
# <missing>      39 minutes ago   RUN /bin/sh -c npm install # buildkit           4.59MB    buildkit.dockerfile.v0
# <missing>      39 minutes ago   COPY ./demo-app/package.json . # buildkit       310B      buildkit.dockerfile.v0
# <missing>      39 minutes ago   EXPOSE map[80/tcp:{}]                           0B        buildkit.dockerfile.v0
# <missing>      39 minutes ago   ENV PORT=80                                     0B        buildkit.dockerfile.v0
# <missing>      3 weeks ago      WORKDIR /app                                    0B        buildkit.dockerfile.v0
# <missing>      4 weeks ago      /bin/sh -c #(nop)  CMD ["node"]                 0B
# <missing>      4 weeks ago      /bin/sh -c #(nop)  ENTRYPOINT ["docker-entry…   0B
# <missing>      4 weeks ago      /bin/sh -c #(nop) COPY file:238737301d473041…   116B
# <missing>      4 weeks ago      /bin/sh -c set -ex   && for key in     6A010…   7.75MB
# <missing>      4 weeks ago      /bin/sh -c #(nop)  ENV YARN_VERSION=1.22.5      0B
# <missing>      4 weeks ago      /bin/sh -c ARCH= && dpkgArch="$(dpkg --print…   92.4MB
# <missing>      4 weeks ago      /bin/sh -c #(nop)  ENV NODE_VERSION=15.3.0      0B
# <missing>      5 weeks ago      /bin/sh -c groupadd --gid 1000 node   && use…   333kB
# <missing>      5 weeks ago      /bin/sh -c set -ex;  apt-get update;  apt-ge…   561MB
# <missing>      5 weeks ago      /bin/sh -c apt-get update && apt-get install…   142MB
# <missing>      5 weeks ago      /bin/sh -c set -ex;  if ! command -v gpg > /…   7.81MB
# <missing>      5 weeks ago      /bin/sh -c apt-get update && apt-get install…   23.2MB
# <missing>      5 weeks ago      /bin/sh -c #(nop)  CMD ["bash"]                 0B
# <missing>      5 weeks ago      /bin/sh -c #(nop) ADD file:373a8875589f170b5…   101MB


# ..:: A Note on Security ::..
# One important note about environment variables and security: Depending on which kind of data you're storing in
# your environment variables, you might not want to include the secure data directly in your Dockerfile.

# Instead, go for a separate environment variables file which is then only used at runtime
# (i.e. when you run your container with docker run). Otherwise, the values are "baked into the image"
# and everyone can read these values
