FROM node

WORKDIR /app

ENV PORT 80

EXPOSE $PORT

COPY demo-app/package.json .

RUN npm install

COPY demo-app .

CMD ["npm", "start"]

