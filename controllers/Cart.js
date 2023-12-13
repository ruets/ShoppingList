'use strict';

var utils = require('../utils/writer.js');
var Cart = require('../service/CartService');

module.exports.cartDELETE = function cartDELETE (req, res, next, shopId) {
  Cart.cartDELETE(shopId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.cartGET = function cartGET (req, res, next, shopId) {
  Cart.cartGET(shopId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.cartPOST = function cartPOST (req, res, next, body, shopId) {
  Cart.cartPOST(body, shopId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};
