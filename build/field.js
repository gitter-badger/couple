(function() {
  var define;

  define = this.define || require('amdefine')(module);

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
        extend = merge(obj)(extend);
        return self;
      };
      self.states = function(newStates) {
        states = states.concat(newStates);
        return self;
      };
      self.optional = function(value) {
        optional = value;
        return self;
      };
      self["default"] = function(obj) {
        def = obj;
        return self;
      };
      return self;
    };
  });

}).call(this);
