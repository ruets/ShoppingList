'use strict';

var utils = require('../utils/writer.js');
var Shop = require('../service/ShopService');

module.exports.shopDELETE = function shopDELETE (req, res, next, shopId) {
  Shop.shopDELETE(shopId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.shopGET = function shopGET (req, res, next, homeId) {
  Shop.shopGET(homeId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.shopGETbyID = function shopGETbyID (req, res, next, shopId) {
  Shop.shopGETbyID(shopId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.shopPOST = function shopPOST (req, res, next, body, homeId) {
  Shop.shopPOST(body, homeId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.shopPUT = function shopPUT (req, res, next, body, shopId) {
  Shop.shopPUT(body, shopId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};
