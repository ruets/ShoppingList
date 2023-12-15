'use strict';

var client = require('../prisma/client')
var utils = require('../utils/utils.js');

/**
 * Delete the home with the given id
 *
 * homeId String Id of the home to delete
 * no response value expected for this operation
 **/
exports.homeDELETE = function(homeId) {
  return new Promise(function(resolve, reject) {
    client.home.delete({
      where: {
        id: homeId
      }
    })
      .then((home) => {
        resolve(
          {
            "description": "Home deleted",
            "links": [
              {
                "href": "/home",
                "rel": "home",
                "method": "GET",
                "description": "Return the list of all homes"
              },
              {
                "href": "/home",
                "rel": "home",
                "method": "POST",
                "description": "Add a home"
              }
            ]
          }
        );
      })
      .catch(error => {
        reject(error);
      })
  });
}


/**
 * Return the list of all homes
 *
 * no response value expected for this operation
 **/
exports.homeGET = function() {
  return new Promise(function(resolve, reject) {
    client.home.findMany()
      .then(homes => {
        homes.forEach(home => {
          home.links = [
            {
              "href": "/home/" + home.id,
              "rel": "home",
              "method": "GET",
              "description": "Return the home with the given id"
            },
            {
              "href": "/home/" + home.id,
              "rel": "home",
              "method": "PUT",
              "description": "Update the home with the given id"
            },
            {
              "href": "/home/" + home.id,
              "rel": "home",
              "method": "DELETE",
              "description": "Delete the home with the given id"
            }
          ];
        });
        resolve(homes);
      })
      .catch(error => {
        reject(error);
      })
  });
}


/**
 * Return the home with the given id
 *
 * homeId String Id of the home to return
 * no response value expected for this operation
 **/
exports.homeGETbyID = function(homeId) {
  return new Promise(function(resolve, reject) {
    client.home.findUnique({
      where: {
        id: homeId
      }
    })
      .then(home => {
        home.links = [
          {
            "href": "/home/" + home.id + "/shop",
            "rel": "shop",
            "method": "GET",
            "description": "Return the list of all shops for this home"
          },
          {
            "href": "/home/" + home.id + "/shop",
            "rel": "shop",
            "method": "POST",
            "description": "Add a shop to this home"
          },
          {
            "href": "/home/" + home.id + "/category",
            "rel": "category",
            "method": "GET",
            "description": "Return the list of all categories for this home"
          },
          {
            "href": "/home/" + home.id + "/category",
            "rel": "category",
            "method": "POST",
            "description": "Add a category to this home"
          }
        ];
        resolve(home);
      })
      .catch( error => {
        reject(error);
      })
  });
}


/**
 * Add a home
 *
 * body Home  (optional)
 * no response value expected for this operation
 **/
exports.homePOST = function(body) {
  return new Promise(function(resolve, reject) {
    client.home.create({
      data: {
        name: body.name,
        key: utils.generateKey()
      }
    })
      .then((home) => {
        resolve(
          {
            "description": "Home created",
            "home": home,
            "links": [
              {
                "href": "/home/" + home.id,
                "rel": "home",
                "method": "GET",
                "description": "Return the home with the given id"
              },
              {
                "href": "/home/" + home.id,
                "rel": "home",
                "method": "PUT",
                "description": "Update the home with the given id"
              },
              {
                "href": "/home/" + home.id,
                "rel": "home",
                "method": "DELETE",
                "description": "Delete the home with the given id"
              }
            ]
          }
        );
      })
      .catch(error => {
        reject(error);
      })
  });
}


/**
 * Update the home with the given id
 *
 * body Home  (optional)
 * homeId String Id of the home to update
 * no response value expected for this operation
 **/
exports.homePUT = function(body,homeId) {
  return new Promise(function(resolve, reject) {
    client.home.update({
      where: {
        id: homeId
      },
      data: {
        name: body.name
      }
    })
      .then((home) => {
        resolve(
          {
            "description": "Home updated",
            "home": home,
            "links": [
              {
                "href": "/home/" + home.id,
                "rel": "home",
                "method": "GET",
                "description": "Return the home with the given id"
              },
              {
                "href": "/home/" + home.id,
                "rel": "home",
                "method": "PUT",
                "description": "Update the home with the given id"
              },
              {
                "href": "/home/" + home.id,
                "rel": "home",
                "method": "DELETE",
                "description": "Delete the home with the given id"
              }
            ]
          }
        );
      })
      .catch(error => {
        reject(error);
      })
  });
}

