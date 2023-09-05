FROM node

WORKDIR /app

COPY demo-app/package.json .

RUN npm install

COPY demo-app .

# This volume which is not directly mapped to a local machine folder
# will get removed when the container is deleted.
VOLUME [ "/app/feedback" ]

EXPOSE 80

CMD ["node", "server.js"]

