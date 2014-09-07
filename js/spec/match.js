(function() {
  var match;

  match = require('../src/match');

  describe('match', function() {
    var data, dataMatch, dataNoMatch, otherData, testData, _i, _j, _len, _len1, _ref, _results;
    testData = [
      {
        value: {
          'hello': 'world',
          'world': 'hello'
        },
        matches: [
          {
            'hello': 'world'
          }, function(a) {
            return (a.hello === 'world') && (a.world === 'hello');
          }
        ]
      }, {
        value: [5],
        matches: [
          [5], function(a) {
            return a === 5;
          }
        ]
      }, {
        value: 'hello world',
        matches: [
          'hello world', function(a) {
            return a === 'hello world';
          }, /hello world/
        ]
      }, {
        value: 10,
        matches: [
          10, function(a) {
            return a === 10;
          }, /10/
        ]
      }, {
        value: false,
        matches: [
          false, function(a) {
            return a === false;
          }, /false/
        ]
      }
    ];
    _results = [];
    for (_i = 0, _len = testData.length; _i < _len; _i++) {
      data = testData[_i];
      _ref = data.matches;
      for (_j = 0, _len1 = _ref.length; _j < _len1; _j++) {
        dataMatch = _ref[_j];
        it("should match " + data.value + " with " + dataMatch, function() {
          return expect(match(dataMatch)(data.value)).toBe(true);
        });
      }
      _results.push((function() {
        var _k, _len2, _results1;
        _results1 = [];
        for (_k = 0, _len2 = testData.length; _k < _len2; _k++) {
          otherData = testData[_k];
          if (data !== otherData) {
            _results1.push((function() {
              var _l, _len3, _ref1, _results2;
              _ref1 = otherData.matches;
              _results2 = [];
              for (_l = 0, _len3 = _ref1.length; _l < _len3; _l++) {
                dataNoMatch = _ref1[_l];
                _results2.push(it("should not match " + data.value + " with " + dataNoMatch, function() {
                  return expect(match(dataNoMatch)(data.value)).toBe(false);
                }));
              }
              return _results2;
            })());
          } else {
            _results1.push(void 0);
          }
        }
        return _results1;
      })());
    }
    return _results;
  });

}).call(this);
