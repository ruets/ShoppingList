'use strict';

var utils = require('../utils/writer.js');
var Item = require('../service/ItemService');

module.exports.itemDELETE = function itemDELETE (req, res, next, itemId) {
  Item.itemDELETE(itemId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.itemGETbyID = function itemGETbyID (req, res, next, itemId) {
  Item.itemGETbyID(itemId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.itemMoveToCart = function itemMoveToCart (req, res, next, itemId) {
  Item.itemMoveToCart(itemId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.itemMoveToShoppingList = function itemMoveToShoppingList (req, res, next, itemId) {
  Item.itemMoveToShoppingList(itemId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.itemPUT = function itemPUT (req, res, next, body, itemId) {
  Item.itemPUT(body, itemId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};
