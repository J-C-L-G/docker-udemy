const express = require('express');
const fs = require('fs');

const app = express();

app.get('/', (request, response) => {
  const data = { products: null, success: false, error: null}
  try {
    data.products = fs.readFileSync('./products.json', 'utf8');
    data.success = true
  } catch (err) {
    data.error = err
  }
  response.json(data)
});

app.listen(80);

