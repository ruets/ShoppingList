'use strict';

var utils = require('../utils/writer.js');
var Home = require('../service/HomeService');

module.exports.homeDELETE = function homeDELETE (req, res, next, homeId) {
  Home.homeDELETE(homeId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.homeGET = function homeGET (req, res, next) {
  Home.homeGET()
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.homeGETbyID = function homeGETbyID (req, res, next, homeId) {
  Home.homeGETbyID(homeId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.homePOST = function homePOST (req, res, next, body) {
  Home.homePOST(body)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.homePUT = function homePUT (req, res, next, body, homeId) {
  Home.homePUT(body, homeId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};
