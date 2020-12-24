#!/bin/sh

# Here we specify with "[host_path]:[container:path]:ro" that we want this volume as READ ONLY however since the temp folder
# is part of the folder we marked as READ ONLY, we need to use a more specific volume to bypass the restriction and write to it
# using -v /app/temp

docker build -t demo-app-watch:bind .
docker run -d -p 3000:80 --name demo-app-watch-container -v demo-app-volume:/app/feedback -v "/Users/JCLG/Documents/docker-udemy/56. Read Only Volume/demo-app:/app:ro" -v /app/node_modules -v /app/temp  demo-app-watch:bind

