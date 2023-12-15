'use strict';

var client = require("../prisma/client")

/**
 * Delete all items in the shopping list for this shop
 *
 * shopId String Id of the shop where delete the items
 * no response value expected for this operation
 **/
exports.shoppingListDELETE = function(shopId) {
  return new Promise(function(resolve, reject) {
    client.item.deleteMany({
      where: {
        shopId: shopId,
        inCart: false
      }
    }).then((shoppingList) => {
      resolve(shoppingList);
    }).catch((error) => {
      reject(error);
    })
  });
}


/**
 * Return the list of all items in the shopping list for this shop
 *
 * shopId String Id of the shop where search to
 * no response value expected for this operation
 **/
exports.shoppingListGET = function(shopId) {
  return new Promise(function(resolve, reject) {
    client.item.findMany({
      where: {
        shopId: shopId,
        inCart: false
      }
    }).then((shoppingList) => {
      resolve(shoppingList);
    }).catch((error) => {
      reject(error);
    })
  });
}


/**
 * Add an item in the shopping list for this shop
 *
 * body Item  (optional)
 * shopId String Id of the shop where add the item
 * no response value expected for this operation
 **/
exports.shoppingListPOST = function(body,shopId) {
  return new Promise(function(resolve, reject) {
    client.item.create({
      data: {
        name: body.name,
        quantity: body.quantity,
        price: body.price,
        inCart: false,
        shopId: shopId,
        categoryId: body.categoryId
      }
    }).then((shoppingList) => {
      resolve(shoppingList);
    }).catch((error) => {
      reject(error);
    })
  });
}

