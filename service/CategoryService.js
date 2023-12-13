'use strict';


/**
 * Delete all categories for this home
 *
 * homeId String Id of the home where delete the categories
 * no response value expected for this operation
 **/
exports.categoryDELETE = function(homeId) {
  return new Promise(function(resolve, reject) {
    resolve();
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
    resolve();
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
    resolve();
  });
}

