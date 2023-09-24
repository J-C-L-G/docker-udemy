FROM node

WORKDIR /app

COPY app-networks/package.json .

RUN npm install

COPY app-networks .

CMD ["node", "app.js"]