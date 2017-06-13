const express = require('express')
const app = express()

app.get('/', function (req, res) {
  res.send('Hello World! my second change')
})

app.post('/', function (req, res) {
  res.send('Got a POST request! my second change')
})

app.listen(3000, function () {
  console.log('Example app listening on port 3000! my second change')
})