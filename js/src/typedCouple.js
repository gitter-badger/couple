(function() {
  var define;

  if (typeof define !== 'function') {
    define = require('amdefine')(module);
  }

  define(['./couple', './type'], function(couple, type) {
    return function() {
      var typedCouple;
      return typedCouple = couple(function(a, b) {
        return typedCouple[type(a)](a, b);
      });
    };
  });

}).call(this);
