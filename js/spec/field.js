(function() {
  var field;

  field = require('../src/field');

  describe('field', function() {
    var f;
    f = null;
    beforeEach(function() {
      return f = field();
    });
    describe('optional', function() {
      it('should not require validation when optional', function() {
        f.optional();
        return expect(f(void 0)).toBe(true);
      });
      return it('should require validation when not optional', function() {
        f.optional(false);
        return expect(f(void 0)).toBe(false);
      });
    });
    describe('required', function() {
      it('should not require validation when optional', function() {
        f.required(false);
        return expect(f(void 0)).toBe(true);
      });
      return it('should require validation when not optional', function() {
        f.required();
        return expect(f(void 0)).toBe(false);
      });
    });
    describe('states', function() {
      beforeEach(function() {
        return f.states([0, 1]);
      });
      it('should validate if in one of the states', function() {
        expect(f(0)).toBe(true);
        return expect(f(1)).toBe(true);
      });
      return it('shouldn\'t validate if not in one of the states', function() {
        expect(f(-1)).toBe(false);
        expect(f({})).toBe(false);
        expect(f([])).toBe(false);
        expect(f(true)).toBe(false);
        return expect(f('')).toBe(false);
      });
    });
    describe('extend', function() {
      beforeEach(function() {
        return f.extend({
          hello: 'world',
          world: 'hello'
        });
      });
      it('should extend nothing', function() {
        return expect(f({
          hello: 'world',
          world: 'hello'
        })).toBe(true);
      });
      it('should extend twice', function() {
        f.extend({
          world: 'bonjour',
          foo: 'bar'
        });
        return expect(f({
          hello: 'world',
          world: 'bonjour',
          foo: 'bar'
        })).toBe(true);
      });
      return it('should extend states', function() {
        f.states([
          {
            one: 'one'
          }, {
            two: 'two'
          }
        ]);
        expect(f({
          hello: 'world',
          world: 'hello',
          one: 'one'
        })).toBe(true);
        expect(f({
          hello: 'world',
          world: 'hello',
          two: 'two'
        })).toBe(true);
        expect(f({
          hello: 'world',
          world: 'hello',
          one: 'one',
          two: 'two'
        })).toBe(false);
        return expect(f({
          hello: 'world',
          world: 'hello'
        })).toBe(false);
      });
    });
    return describe('default', function() {
      beforeEach(function() {
        return f["default"]({
          hello: 'world'
        });
      });
      it('should use default when property is not defined', function() {
        f.extend({
          hello: 'world',
          world: 'hello'
        });
        return expect(f({
          world: 'hello'
        })).toBe(true);
      });
      return it('should not use default when property is defined', function() {
        f.extend({
          hello: 'foobar',
          world: 'hello'
        });
        return expect(f({
          hello: 'foobar',
          world: 'hello'
        })).toBe(true);
      });
    });
  });

}).call(this);
