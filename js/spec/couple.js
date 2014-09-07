(function() {
  var couple;

  couple = require('../src/couple');

  describe('couple', function() {
    return it('should call `mod` with `a` and `b`', function() {
      var a, b;
      a = {};
      b = {};
      expect(couple(function(a, b) {
        return a;
      })(a)(b)).toBe(a);
      return expect(couple(function(a, b) {
        return b;
      })(a)(b)).toBe(b);
    });
  });

}).call(this);
