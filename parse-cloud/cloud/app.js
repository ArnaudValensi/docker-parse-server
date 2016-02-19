'use strict';

var PORT = 1338;

var express = require('express');
var bodyParser = require('body-parser');
var app = express();

app.set('views', __dirname + '/../public');
app.engine('html', require('ejs').renderFile);
app.set('view engine', 'html');

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.get('/robots.txt', function (req, res) {
  res.type('text/plain');
  res.send('User-agent: *\nDisallow:\n');
});

app.get('*', function (req, res) {
  res.render('index.html');
});

app.listen(PORT, function() {
  console.log('public running on http://localhost:'+ PORT + '/');
});
