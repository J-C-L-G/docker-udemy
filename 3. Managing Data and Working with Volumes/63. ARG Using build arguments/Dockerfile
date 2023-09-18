FROM node

WORKDIR /app

COPY demo-app/package.json .

RUN npm install

COPY demo-app .

ARG DEFAULT_PORT=80

ENV PORT $DEFAULT_PORT

EXPOSE $PORT

CMD ["npm", "start"]

