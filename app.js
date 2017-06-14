const express = require('express')
const app = express()

app.get('/', function (req, res) {
  res.send('Hello World! my third change')
})

app.post('/', function (req, res) {
  res.send('Got a POST request! my third change')
})

app.listen(3000, function () {
  console.log('Example app listening on port 3000! my third change')
})