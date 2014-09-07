(function() {
  var define;

  if (typeof define !== 'function') {
    define = require('amdefine')(module);
  }

  define(['./typedCouple', './type'], function(typedCouple, type) {
    var match;
    match = typedCouple();
    match.object = match.array = match.reference = function(a, b) {
      var keys;
      if (type(a) === type(b)) {
        keys = Object.keys(a);
        return keys.filter(function(key) {
          return match(a[key])(b[key]);
        }).length === keys.length;
      } else {
        return false;
      }
    };
    match.number = match.string = match.boolean = match.primitive = function(a, b) {
      return a === b;
    };
    match.undefined = function(a, b) {
      return true;
    };
    match["function"] = function(a, b) {
      return a(b);
    };
    match.regexp = function(a, b) {
      return a.test(b);
    };
    return match;
  });

}).call(this);
