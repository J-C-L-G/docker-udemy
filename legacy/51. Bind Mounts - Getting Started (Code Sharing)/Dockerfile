FROM node

WORKDIR /app

EXPOSE 80

COPY demo-app/package.json .

RUN npm install

COPY demo-app .

# We can use this annonymous volume or pass a "-v /app/node_modules" flag to avoid rebuild image
# VOLUME [ "/app/node_moedules" ]

CMD ["node", "server.js"]

