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
      resolve(
        {
          "description": "Item deleted",
          "links": [
            {
              "href": "/shop/" + item.shopId + "/shoppingList",
              "rel": "shoppingList",
              "method": "GET",
              "description": "Return the list of all items in the shopping list for this shop"
            },
            {
              "href": "/shop/" + item.shopId + "/shoppingList",
              "rel": "shoppingList",
              "method": "POST",
              "description": "Add an item in the shopping list for this shop"
            },
            {
              "href": "/shop/" + item.shopId + "/cart",
              "rel": "cart",
              "method": "GET",
              "description": "Return the list of all items in the cart for this shop"
            },
            {
              "href": "/shop/" + item.shopId + "/cart",
              "rel": "cart",
              "method": "POST",
              "description": "Add an item in the cart for this shop"
            }
          ]
        }
      );
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
      item.links = [
        {
          "href": "/item/" + item.id + "/moveToCart",
          "rel": "moveToCart",
          "method": "PUT",
          "description": "Move the item with the given id from the shopping list to the cart"
        },
        {
          "href": "/item/" + item.id + "/moveToShoppingList",
          "rel": "moveToShoppingList",
          "method": "PUT",
          "description": "Move the item with the given id from the cart to the shopping list"
        }
      ]
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
      resolve(
        {

          "description": "Item moved to cart",
          "item": item,
          "links": [
            {
              "href": "/item/" + item.id + "/moveToCart",
              "rel": "moveToCart",
              "method": "PUT",
              "description": "Move the item with the given id from the shopping list to the cart"
            },
            {
              "href": "/item/" + item.id + "/moveToShoppingList",
              "rel": "moveToShoppingList",
              "method": "PUT",
              "description": "Move the item with the given id from the cart to the shopping list"
            }
          ]
        }
      );
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
      resolve(
        {

          "description": "Item moved to shopping list",
          "item": item,
          "links": [
            {
              "href": "/item/" + item.id + "/moveToCart",
              "rel": "moveToCart",
              "method": "PUT",
              "description": "Move the item with the given id from the shopping list to the cart"
            },
            {
              "href": "/item/" + item.id + "/moveToShoppingList",
              "rel": "moveToShoppingList",
              "method": "PUT",
              "description": "Move the item with the given id from the cart to the shopping list"
            }
          ]
        }
      );
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
      resolve(
        {
          "description": "Item updated",
          "item": item,
          "links": [
            {
              "href": "/item/" + item.id,
              "rel": "item",
              "method": "GET",
              "description": "Return the item with the given id"
            },
            {
              "href": "/item/" + item.id,
              "rel": "item",
              "method": "PUT",
              "description": "Update the item with the given id"
            },
            {
              "href": "/item/" + item.id,
              "rel": "item",
              "method": "DELETE",
              "description": "Delete the item with the given id"
            }
          ]
        }
      );
    }).catch((error) => {
      reject(error);
    })
  });
}

