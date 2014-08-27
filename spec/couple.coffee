couple = require('../src/couple')

# Tests normal couple.
describe('couple', () ->
    it('should call `mod` with `a` and `b`', () ->
        a = {}
        b = {}
        expect(couple((a, b) -> a)(a)(b)).toBe(a)
        expect(couple((a, b) -> b)(a)(b)).toBe(b)
    )
)
