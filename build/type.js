(function() {
  var define;

  define = this.define || require('amdefine')(module);

  define([], function() {
    var type;
    return type = function(value) {
      var valueType;
      valueType = typeof value;
      switch (valueType) {
        case 'object':
          switch (value.constructor) {
            case Array:
              return 'array';
            case RegExp:
              return 'regexp';
            default:
              return 'object';
          }
          break;
        default:
          return valueType;
      }
    };
  });

}).call(this);
