'use strict';


/**
 * Return the description of the API and the list of methods
 *
 * no response value expected for this operation
 **/
exports.rootGET = function() {
  return new Promise(function(resolve, reject) {
    resolve(
      {
        "description": "This is the API for the ShoppingList application",
        "methods": [
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
          },
          {
            "href": "/docs",
            "rel": "docs",
            "method": "GET",
            "description": "Return the Swagger documentation"
          }
        ]
      }
    );
  });
}

