(function() {
  var define;

  if (typeof define !== 'function') {
    define = require('amdefine')(module);
  }

  define(['./merge', './validate'], function(merge, validate) {
    return function() {
      var def, extend, optional, self, states;
      optional = false;
      states = [];
      extend = {};
      def = void 0;
      self = function(value) {
        var mergedValue;
        mergedValue = merge(value)(def);
        if (value == null) {
          return optional;
        } else if (states.length > 0) {
          return states.filter(function(state) {
            var error;
            state = merge(state)(extend);
            try {
              return validate(state)(mergedValue);
            } catch (_error) {
              error = _error;
              return false;
            }
          }).length === 1;
        } else {
          return validate(extend)(mergedValue);
        }
      };
      self.extend = function(obj) {
        return extend = merge(obj)(extend);
      };
      self.states = function(newStates) {
        return states = states.concat(newStates);
      };
      self.required = function(value) {
        return optional = value != null ? !value : false;
      };
      self.optional = function(value) {
        return optional = value != null ? value : true;
      };
      self["default"] = function(obj) {
        return def = obj;
      };
      return self;
    };
  });

}).call(this);
