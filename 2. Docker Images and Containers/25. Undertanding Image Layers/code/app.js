const express = require('express');

const app = express();

app.get('/', (request, response) => {
  response.json({success: true, update: true})
});

app.listen(80);

