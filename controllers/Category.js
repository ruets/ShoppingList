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

module.exports.categoryDELETEbyID = function categoryDELETEbyID (req, res, next, categoryId) {
  Category.categoryDELETEbyID(categoryId)
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

module.exports.categoryGETbyID = function categoryGETbyID (req, res, next, categoryId) {
  Category.categoryGETbyID(categoryId)
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

module.exports.categoryPUT = function categoryPUT (req, res, next, body, categoryId) {
  Category.categoryPUT(body, categoryId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};
