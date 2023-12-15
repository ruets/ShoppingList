'use strict';

var client = require("../prisma/client")

/**
 * Delete the item with the given id
 *
 * itemId String Id of the item to delete
 * no response value expected for this operation
 **/
exports.itemDELETE = function(itemId) {
  return new Promise(function(resolve, reject) {
    client.item.delete({
      where: {
        id: itemId
      }
    }).then((item) => {
      resolve(item);
    }).catch((error) => {
      reject(error);
    })
  });
}


/**
 * Return the item with the given id
 *
 * itemId String Id of the item to return
 * no response value expected for this operation
 **/
exports.itemGETbyID = function(itemId) {
  return new Promise(function(resolve, reject) {
    client.item.findUnique({
      where: {
        id: itemId
      }
    }).then((item) => {
      resolve(item);
    }).catch((error) => {
      reject(error);
    })
  });
}


/**
 * Move the item with the given id from the shopping list to the cart
 *
 * itemId String Id of the item to move
 * no response value expected for this operation
 **/
exports.itemMoveToCart = function(itemId) {
  return new Promise(function(resolve, reject) {
    client.item.update({
      where: {
        id: itemId
      },
      data: {
        inCart: true
      }
    }).then((item) => {
      resolve(item);
    }).catch((error) => {
      reject(error);
    })
  });
}


/**
 * Move the item with the given id from the cart to the shopping list
 *
 * itemId String Id of the item to move
 * no response value expected for this operation
 **/
exports.itemMoveToShoppingList = function(itemId) {
  return new Promise(function(resolve, reject) {
    client.item.update({
      where: {
        id: itemId
      },
      data: {
        inCart: false
      }
    }).then((item) => {
      resolve(item);
    }).catch((error) => {
      reject(error);
    })
  });
}


/**
 * Update the item with the given id
 *
 * body Item  (optional)
 * itemId String Id of the item to update
 * no response value expected for this operation
 **/
exports.itemPUT = function(body,itemId) {
  return new Promise(function(resolve, reject) {
    client.item.update({
      where: {
        id: itemId
      },
      data: {
        name: body.name,
        quantity: body.quantity,
        price: body.price,
        shopId: body.shopId,
        categoryId: body.categoryId
      }
    }).then((item) => {
      resolve(item);
    }).catch((error) => {
      reject(error);
    })
  });
}

