'use strict';

var utils = require('../utils/writer.js');
var ShoppingList = require('../service/ShoppingListService');

module.exports.shoppingListDELETE = function shoppingListDELETE (req, res, next, shopId) {
  ShoppingList.shoppingListDELETE(shopId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.shoppingListGET = function shoppingListGET (req, res, next, shopId) {
  ShoppingList.shoppingListGET(shopId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.shoppingListPOST = function shoppingListPOST (req, res, next, body, shopId) {
  ShoppingList.shoppingListPOST(body, shopId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};
