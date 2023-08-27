FROM node

WORKDIR /app

EXPOSE 80

COPY ./demo-app/package.json .

RUN npm install

COPY . .

CMD ["npm", "start"]

