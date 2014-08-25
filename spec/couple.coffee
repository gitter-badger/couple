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

# Tests typed couple.
describe('couple.typed', () ->
    # Typed couple.
    coupleTest = couple.typed()

    # Test data.
    testAs = {
        'object': {}
        'array': []
        'string': ''
        'number': 0
        'boolean': false
        'function': () -> () -> null
        'regexp': new RegExp('hello')
    }
    testB = {}

    # Response constructor.
    response = (type) -> (a, b) -> {
        type: type
        a: a
        b: b
    }

    # Tests that the typed couple calls the correct function.
    testType = (type) ->
        coupleTest[type] = response(type)

        it("should call `couple.#{type} with `a` and `b` if `a` is of type `#{type}`.", () ->
            result = coupleTest(testAs[type])(testB)
            expect(result.a).toBe(testAs[type])
            expect(result.b).toBe(testB)
            expect(result.type).toBe(type)
        )

    # Carry out tests.
    testType('object')
    testType('array')
    testType('string')
    testType('boolean')
    testType('number')
    testType('function')
    testType('regexp')
)
