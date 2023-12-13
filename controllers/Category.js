'use strict';

var utils = require('../utils/writer.js');
var Category = require('../service/CategoryService');

module.exports.categoryDELETE = function categoryDELETE (req, res, next, homeId) {
  Category.categoryDELETE(homeId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.categoryGET = function categoryGET (req, res, next, homeId) {
  Category.categoryGET(homeId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.categoryPOST = function categoryPOST (req, res, next, body, homeId) {
  Category.categoryPOST(body, homeId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};
