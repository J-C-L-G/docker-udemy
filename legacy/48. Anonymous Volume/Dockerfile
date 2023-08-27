FROM node

WORKDIR /app

EXPOSE 80

COPY demo-app/package.json .

RUN npm install

COPY demo-app .

# This volume which is not directly mapped to a local machine folder will get reoved when the container is deleted.
VOLUME [ "/app/feedback" ]

CMD ["node", "server.js"]

