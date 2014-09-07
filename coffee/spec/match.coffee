match = require('../src/match')

# Tests match.
describe('match', () ->
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
            it("should match #{data.value} with #{dataMatch}", () ->
                expect(match(dataMatch)(data.value)).toBe(true)

            )

        for otherData in testData
            if data isnt otherData
                for dataNoMatch in otherData.matches
                    it("should not match #{data.value} with #{dataNoMatch}", () ->
                        expect(match(dataNoMatch)(data.value)).toBe(false)
                    )
)
