'use strict';

var utils = require('../utils/writer.js');
var Welcome = require('../service/WelcomeService');

module.exports.rootGET = function rootGET (req, res, next) {
  Welcome.rootGET()
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};
