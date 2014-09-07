(function() {
  var typedCouple;

  typedCouple = require('../src/typedCouple');

  describe('couple.typed', function() {
    var coupleTest, response, testAs, testB, testType;
    coupleTest = typedCouple();
    testAs = {
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
    testB = {};
    response = function(type) {
      return function(a, b) {
        return {
          type: type,
          a: a,
          b: b
        };
      };
    };
    testType = function(type) {
      coupleTest[type] = response(type);
      return it("should call `couple." + type + " with `a` and `b` if `a` is of type `" + type + "`.", function() {
        var result;
        result = coupleTest(testAs[type])(testB);
        expect(result.a).toBe(testAs[type]);
        expect(result.b).toBe(testB);
        return expect(result.type).toBe(type);
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
