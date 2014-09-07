(function() {
  var define;

  define = this.define || require('amdefine')(module);

  define(['./typedCouple', './type', './match'], function(typedCouple, type, match) {
    var validate;
    validate = typedCouple();
    validate.object = validate.array = validate.reference = function(a, b) {
      var aJoinedKeys, aKeys, bJoinedKeys, bKeys;
      if (type(a) === type(b)) {
        aKeys = Object.keys(a);
        bKeys = Object.keys(b);
        aJoinedKeys = aKeys.sort().join(',');
        bJoinedKeys = bKeys.sort().join(',');
        if ((aKeys.length !== bKeys.length) || (aJoinedKeys !== bJoinedKeys)) {
          throw new Error("Invalid keys. Expected keys from `" + aJoinedKeys + "`, but found `" + bJoinedKeys + "`.");
        } else {
          return aKeys.filter(function(key) {
            if (validate(a[key])(b[key])) {
              return true;
            } else {
              throw new Error("Expected a valid " + key + ", but found `" + a[key] + "`.");
            }
          }).length === aKeys.length;
        }
      } else {
        throw new Error("Expected an `object`, but found `" + b + "`.");
      }
    };
    validate.number = validate.string = validate.boolean = validate.primitive = match.primitive;
    validate.undefined = match.undefined;
    validate["function"] = match["function"];
    validate.regexp = match.regexp;
    return validate;
  });

}).call(this);
