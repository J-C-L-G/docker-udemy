FROM node

WORKDIR /app

COPY demo-app/package.json .

RUN npm install

COPY demo-app .

EXPOSE 80

CMD ["node", "server.js"]
