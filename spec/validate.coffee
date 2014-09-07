validate = require('../build/validate')

# Tests match.
describe('validate', () ->
    # Test data.
    testData = [
        {
            value: {
                'hello': 'world'
                'world': 'hello'
            }
            matches: [
                {
                    'hello': 'world'
                }
                (a) -> (a.hello is 'world') and (a.world is 'hello')
            ]
        }
        {
            value: [5]
            matches: [
                [5]
                (a) -> a is 5
            ]
        }
        {
            value: 'hello world'
            matches: [
                'hello world'
                (a) -> a is 'hello world'
                /hello world/
            ]
        }
        {
            value: 10
            matches: [
                10
                (a) -> a is 10
                /10/
            ]
        }
        {
            value: false
            matches: [
                false
                (a) -> a is false
                /false/
            ]
        }
    ]

    # Run tests.
    for data in testData
        for dataMatch in data.matches
            it("should validate #{data.value} with #{dataMatch}", () ->
                try
                    expect(validate(dataMatch)(data.value)).toBe(true)
                catch err
                    expect(false).toBe(true)
            )

        for otherData in testData
            if data isnt otherData
                for dataNoMatch in otherData.matches
                    it("should not validate #{data.value} with #{dataNoMatch}", () ->
                        try
                            expect(validate(dataNoMatch)(data.value)).toBe(false)
                        catch err
                            expect(false).toBe(false)
                    )
)
