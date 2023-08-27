#!/bin/sh

# We will include a new dependency to autowatch over source code:
#   "devDependencies": {
#       "nodemon": "^2.0.4"
#   }

# And build our image & container
docker build -t demo-app-watch:bind .
docker run -d -p 3000:80 --name demo-app-watch-container -v demo-app-volume:/app/feedback -v "/Users/JCLG/Documents/docker-udemy/54. Bind Mounts - Nodemon in Container/demo-app:/app" -v /app/node_modules  demo-app-watch:bind

