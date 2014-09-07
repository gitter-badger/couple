(function() {
  var define;

  define = this.define || require('amdefine')(module);

  define(['./couple', './type'], function(couple, type) {
    return function() {
      var typedCouple;
      return typedCouple = couple(function(a, b) {
        return typedCouple[type(a)](a, b);
      });
    };
  });

}).call(this);
