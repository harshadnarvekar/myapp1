const express = require('express')
const app = express()

app.get('/', function (req, res) {
  res.send('Hello World! my first change')
})

app.post('/', function (req, res) {
  res.send('Got a POST request! my first change')
})

app.listen(3000, function () {
  console.log('Example app listening on port 3000! my first change')
})