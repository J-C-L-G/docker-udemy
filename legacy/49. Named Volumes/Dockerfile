FROM node

WORKDIR /app

EXPOSE 80

COPY demo-app/package.json .

RUN npm install

COPY demo-app .

CMD ["node", "server.js"]

