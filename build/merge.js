(function() {
  var define;

  if (typeof define !== 'function') {
    define = require('amdefine')(module);
  }

  define(['./typedCouple', './type'], function(typedCouple, type) {
    var merge;
    merge = typedCouple();
    merge.object = merge.array = merge.reference = function(a, b) {
      var aKeys, bKeys, obj;
      if (type(a) === type(b)) {
        obj = {};
        bKeys = Object.keys(b);
        bKeys.forEach(function(key) {
          return obj[key] = b[key];
        });
        aKeys = Object.keys(a);
        aKeys.forEach(function(key) {
          return obj[key] = merge(a[key])(b[key]);
        });
        return obj;
      } else {
        return a;
      }
    };
    merge.number = merge.string = merge.boolean = merge.primitive = function(a, b) {
      return a;
    };
    merge.undefined = function(a, b) {
      return b;
    };
    merge["function"] = function(a, b) {
      return a(b);
    };
    merge.regexp = function(a, b) {
      return a.test(b);
    };
    return merge;
  });

}).call(this);
