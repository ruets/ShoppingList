'use strict';

var client = require('../prisma/client')

/**
 * Delete all categories for this home
 *
 * homeId String Id of the home where delete the categories
 * no response value expected for this operation
 **/
exports.categoryDELETE = function(homeId) {
  return new Promise(function(resolve, reject) {
    client.category.deleteMany({
      where: {
        homeId: homeId
      }
    }).then((categories) => {
      resolve(categories);
    }).catch((error) => {
      reject(error);
    })
  });
}


/**
 * Delete the category with the given id
 *
 * categoryId String Id of the category to delete
 * no response value expected for this operation
 **/
exports.categoryDELETEbyID = function(categoryId) {
  return new Promise(function(resolve, reject) {
    client.category.delete({
      where: {
        id: categoryId
      }
    }).then((category) => {
      resolve(category);
    }).catch((error) => {
      reject(error);
    })
  });
}


/**
 * Return the list of all categories for this home
 *
 * homeId String Id of the home where search to
 * no response value expected for this operation
 **/
exports.categoryGET = function(homeId) {
  return new Promise(function(resolve, reject) {
    client.category.findMany({
      where: {
        homeId: homeId
      }
    }).then((categories) => {
      resolve(categories);
    }).catch((error) => {
      reject(error);
    })
  });
}


/**
 * Return the category with the given id
 *
 * categoryId String Id of the category to return
 * no response value expected for this operation
 **/
exports.categoryGETbyID = function(categoryId) {
  return new Promise(function(resolve, reject) {
    client.category.findUnique({
      where: {
        id: categoryId
      },
      include: {
        items: true
      }
    }).then((category) => {
      resolve(category);
    }).catch((error) => {
      reject(error);
    })
  });
}


/**
 * Add a category for this home
 *
 * body Category  (optional)
 * homeId String Id of the home where add the category
 * no response value expected for this operation
 **/
exports.categoryPOST = function(body,homeId) {
  return new Promise(function(resolve, reject) {
    client.category.create({
      data: {
        name: body.name,
        homeId: homeId
      }
    }).then((category) => {
      resolve(category);
    }).catch((error) => {
      reject(error);
    })
  });
}


/**
 * Update the category with the given id
 *
 * body Category  (optional)
 * categoryId String Id of the category to update
 * no response value expected for this operation
 **/
exports.categoryPUT = function(body,categoryId) {
  return new Promise(function(resolve, reject) {
    client.category.update({
      where: {
        id: categoryId
      },
      data: {
        name: body.name
      }
    }).then((category) => {
      resolve(category);
    }).catch((error) => {
      reject(error);
    })
  });
}

