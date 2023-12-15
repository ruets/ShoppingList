'use strict';

var client = require('../prisma/client')

/**
 * Delete the shop with the given id
 *
 * shopId String Id of the shop to delete
 * no response value expected for this operation
 **/
exports.shopDELETE = function(shopId) {
  return new Promise(function(resolve, reject) {
    client.shop.delete({
      where: {
        id: shopId
      }
    }).then((shop) => {
      resolve(shop);
    }).catch((error) => {
      reject(error);
    })
  });
}


/**
 * Return the list of all shops for this home
 *
 * homeId String Id of the home where search to
 * no response value expected for this operation
 **/
exports.shopGET = function(homeId) {
  return new Promise(function(resolve, reject) {
    client.shop.findMany({
      where: {
        homeId: homeId
      }
    }).then((shops) => {
      resolve(shops);
    }).catch((error) => {
      reject(error);
    })
  });
}


/**
 * Return the shop with the given id
 *
 * shopId String Id of the shop to return
 * no response value expected for this operation
 **/
exports.shopGETbyID = function(shopId) {
  return new Promise(function(resolve, reject) {
    client.shop.findUnique({
      where: {
        id: shopId
      }
    }).then((shop) => {
      resolve(shop);
    }).catch((error) => {
      reject(error);
    })
  });
}


/**
 * Add a shop for this home
 *
 * body Shop  (optional)
 * homeId String Id of the home where add the shop
 * no response value expected for this operation
 **/
exports.shopPOST = function(body,homeId) {
  return new Promise(function(resolve, reject) {
    client.shop.create({
      data: {
        name: body.name,
        homeId: homeId
      }
    }).then((shop) => {
      resolve(shop);
    }).catch((error) => {
      reject(error);
    })
  });
}


/**
 * Update the shop with the given id
 *
 * body Shop  (optional)
 * shopId String Id of the shop to update
 * no response value expected for this operation
 **/
exports.shopPUT = function(body,shopId) {
  return new Promise(function(resolve, reject) {
    client.shop.update({
      where: {
        id: shopId
      },
      data: {
        name: body.name
      }
    }).then((shop) => {
      resolve(shop);
    }).catch((error) => {
      reject(error);
    })
  });
}

