type = require('../src/type')

# Tests type function.
describe('type', () ->
    # Test data.
    values = {
        'object': {}
        'array': []
        'string': ''
        'number': 0
        'boolean': false
        'function': () -> () -> null
        'regexp': new RegExp('hello')
    }

    # Tests that the typed couple calls the correct function.
    testType = (givenType) ->
        it("should call return `'#{givenType}'` when given `#{givenType}`.", () ->
            expect(type(values[givenType])).toBe(givenType)
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
