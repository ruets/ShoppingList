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
      resolve(
        {
          "description": "All items in the shopping list for this shop deleted",
          "links": [
            {
              "href": "/shop/" + shopId + "/shoppingList",
              "rel": "shoppingList",
              "method": "GET",
              "description": "Return the list of all items in the shopping list for this shop"
            },
            {
              "href": "/shop/" + shopId + "/shoppingList",
              "rel": "shoppingList",
              "method": "POST",
              "description": "Add an item in the shopping list for this shop"
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
      shoppingList.forEach(item => {
        item.links = [
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
      });
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
    }).then((item) => {
      resolve(
        {
          "description": "Item added to the shopping list for this shop",
          "shoppingList": item,
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

