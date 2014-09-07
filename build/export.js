(function() {
  var define;

  define = this.define || require('amdefine')(module);

  define(['./couple', './typedCouple', './field', './match', './merge', './type', './validate'], function(couple, typedCouple, field, match, merge, type, validate) {
    return {
      couple: couple,
      typedCouple: typedCouple,
      field: field,
      match: match,
      merge: merge,
      type: type,
      validate: validate
    };
  });

}).call(this);
