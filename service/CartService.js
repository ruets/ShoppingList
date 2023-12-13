'use strict';


/**
 * Delete all items in the cart for this shop
 *
 * shopId String Id of the shop where delete the items
 * no response value expected for this operation
 **/
exports.cartDELETE = function(shopId) {
  return new Promise(function(resolve, reject) {
    resolve();
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
    resolve();
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
    resolve();
  });
}

