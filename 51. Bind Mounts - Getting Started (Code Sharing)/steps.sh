#!/bin/sh

# Contrary to volume which is controller by docker, in a bind mount we can control the folder
# in the host machine where a specific folder will point, these are great for persistent and editable data.

docker build -t demo-app:bind .

# We will include the bind mount as a second volume "-v host_file_path:container_path"
# macOS / Linux: -v $(pwd):/app
# Windows: -v "%cd%":/app

docker run -d -p 3000:80 --name demo-app-container -v demo-app-volume:/app/feedback -v "/Users/JCLG/Documents/docker-udemy/51. Bind Mounts - Getting Started (Code Sharing)/demo-app:/app"  demo-app:bind

# when we run the container we will see the following error even when we installed the node modules as part of the docker build image
#  node:internal/modules/cjs/loader:922
#    throw err;
#    ^
#
#  Error: Cannot find module 'express'
#  Require stack:
#  - /app/server.js
#      at Function.Module._resolveFilename (node:internal/modules/cjs/loader:919:15)
#      at Function.Module._load (node:internal/modules/cjs/loader:763:27)
#      at Module.require (node:internal/modules/cjs/loader:991:19)
#      at require (node:internal/modules/cjs/helpers:92:18)
#      at Object.<anonymous> (/app/server.js:5:17)
#      at Module._compile (node:internal/modules/cjs/loader:1102:14)
#      at Object.Module._extensions..js (node:internal/modules/cjs/loader:1131:10)
#      at Module.load (node:internal/modules/cjs/loader:967:32)
#      at Function.Module._load (node:internal/modules/cjs/loader:807:14)
#      at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:76:12) {
#    code: 'MODULE_NOT_FOUND',
#    requireStack: [ '/app/server.js' ]
#  }

# The reason for this is that when plug the bind mount, we are replacing the "/app" folder content that was created when we built
# the image, all the node_modules required to run are gone and the application can't start.

docker run -d -p 3000:80 --name demo-app-container -v demo-app-volume:/app/feedback -v "/Users/JCLG/Documents/docker-udemy/51. Bind Mounts - Getting Started (Code Sharing)/demo-app:/app" -v /app/node_modules  demo-app:bind

# In this case, docker will keep the most specific path when there is a class so in this case:
# /Users/JCLG/Documents/docker-udemy/51. Bind Mounts - Getting Started (Code Sharing)/demo-app:/app
# /app/node_modules
# From these 2 volumes, node_modules will be kept as a anonymous volume with what comes along when the image was built, hence the
# node_modules folder created inside the container will be available
# now if we change something in the bind mount, it should reflect on the running application

