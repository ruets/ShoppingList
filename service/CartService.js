'use strict';

var client = require('../prisma/client')

/**
 * Delete all items in the cart for this shop
 *
 * shopId String Id of the shop where delete the items
 * no response value expected for this operation
 **/
exports.cartDELETE = function(shopId) {
  return new Promise(function(resolve, reject) {
    client.item.deleteMany({
      where: {
        shopId: shopId,
        inCart: true
      }
    }).then((cart) => {
      resolve(
        {
          "description": "All items in the cart for this shop deleted",
          "links": [
            {
              "href": "/shop/" + shopId + "/cart",
              "rel": "cart",
              "method": "GET",
              "description": "Return the list of all items in the cart for this shop"
            },
            {
              "href": "/shop/" + shopId + "/cart",
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
 * Return the list of all items in the cart for this shop
 *
 * shopId String Id of the shop where search to
 * no response value expected for this operation
 **/
exports.cartGET = function(shopId) {
  return new Promise(function(resolve, reject) {
    client.item.findMany({
      where: {
        shopId: shopId,
        inCart: true
      }
    }).then((cart) => {
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
      resolve(cart);
    }).catch((error) => {
      reject(error);
    })
  });
}


/**
 * Add an item in the cart for this shop
 *
 * body Item  (optional)
 * shopId String Id of the shop where add the item
 * no response value expected for this operation
 **/
exports.cartPOST = function(body,shopId) {
  return new Promise(function(resolve, reject) {
    client.item.create({
      data: {
        name: body.name,
        quantity: body.quantity,
        price: body.price,
        inCart: true,
        shopId: shopId,
        categoryId: body.categoryId
      }
    }).then((item) => {
      resolve(
        {
          "description": "Item added in the cart for this shop",
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
