(function() {
  var define;

  define = this.define || require('amdefine')(module);

  define([], function() {
    return function(mod) {
      return function(a) {
        return function(b) {
          return mod(a, b);
        };
      };
    };
  });

}).call(this);
