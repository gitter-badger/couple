(function() {
  var type;

  type = require('../src/type');

  describe('type', function() {
    var testType, values;
    values = {
      'object': {},
      'array': [],
      'string': '',
      'number': 0,
      'boolean': false,
      'function': function() {
        return function() {
          return null;
        };
      },
      'regexp': new RegExp('hello')
    };
    testType = function(givenType) {
      return it("should call return `'" + givenType + "'` when given `" + givenType + "`.", function() {
        return expect(type(values[givenType])).toBe(givenType);
      });
    };
    testType('object');
    testType('array');
    testType('string');
    testType('boolean');
    testType('number');
    testType('function');
    return testType('regexp');
  });

}).call(this);
