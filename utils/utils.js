// function to generate a random key for the home (length 6)
var generateKey = function() {
  var key = "";
  var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

  for (var i = 0; i < 6; i++)
    key += possible.charAt(Math.floor(Math.random() * possible.length));

  return key;
}

module.exports = {
  generateKey: generateKey
}
