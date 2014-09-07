(function() {
  var merge;

  merge = require('../src/merge');

  describe('merge', function() {
    var aKey, aKeys, bKey, bKeys, funcObj, results, testAs, testBs, testMerge, _i, _j, _len, _len1;
    funcObj = funcObj = {
      name: 'funcObj'
    };
    testAs = {
      object: {
        b: 'B2',
        c: 'C2'
      },
      array: [void 0, '12', '22'],
      string: 'string2',
      number: 2,
      boolean: true,
      "function": function() {
        return funcObj;
      },
      regexp: new RegExp('regexp')
    };
    testBs = {
      object: {
        a: 'A1',
        b: 'B1'
      },
      array: ['01', '11'],
      string: 'string1',
      number: 1,
      boolean: false
    };
    results = {
      object: testAs.object,
      array: testAs.array,
      string: testAs.string,
      number: testAs.number,
      boolean: testAs.boolean,
      "function": funcObj,
      regexp: false
    };
    testMerge = function(a, b) {
      return it("should merge a `" + a + "` with a `" + b + "`", function() {
        return expect(merge(testAs[a])(testBs[b])).toBe(results[a]);
      });
    };
    aKeys = Object.keys(testAs);
    bKeys = Object.keys(testBs);
    for (_i = 0, _len = aKeys.length; _i < _len; _i++) {
      aKey = aKeys[_i];
      for (_j = 0, _len1 = bKeys.length; _j < _len1; _j++) {
        bKey = bKeys[_j];
        if (aKey !== bKey) {
          testMerge(aKey, bKey);
        }
      }
    }
    it('should merge one `object` with another', function() {
      var merged;
      merged = merge(testAs.object)(testBs.object);
      expect(merged.a).toBe(testBs.object.a);
      expect(merged.b).toBe(testAs.object.b);
      return expect(merged.c).toBe(testAs.object.c);
    });
    it('should merge one `array` with another', function() {
      var merged;
      merged = merge(testAs.array)(testBs.array);
      expect(merged[0]).toBe(testBs.array[0]);
      expect(merged[1]).toBe(testAs.array[1]);
      return expect(merged[2]).toBe(testAs.array[2]);
    });
    testMerge('string', 'string');
    testMerge('number', 'number');
    return testMerge('boolean', 'boolean');
  });

}).call(this);
