merge = require('../build/merge')

# Tests merge.
describe('merge', () ->
    # Test data.
    funcObj = funcObj = {name: 'funcObj'}

    testAs = {
        object: {
            b: 'B2'
            c: 'C2'
        }
        array: [
            undefined
            '12'
            '22'
        ]
        string: 'string2'
        number: 2
        boolean: true
        function: () -> funcObj
        regexp: new RegExp('regexp')
    }

    testBs = {
        object: {
            a: 'A1'
            b: 'B1'
        }
        array: [
            '01'
            '11'
        ]
        string: 'string1'
        number: 1
        boolean: false
    }

    results = {
        object: testAs.object
        array: testAs.array
        string: testAs.string
        number: testAs.number
        boolean: testAs.boolean
        function: funcObj
        regexp: false
    }

    # Tests merges.
    testMerge = (a, b) ->
        it("should merge a `#{a}` with a `#{b}`", () ->
            expect(merge(testAs[a])(testBs[b])).toBe(results[a])
        )

    # Run tests where the keys are different.
    aKeys = Object.keys(testAs)
    bKeys = Object.keys(testBs)

    for aKey in aKeys
        for bKey in bKeys
            if aKey isnt bKey then testMerge(aKey, bKey)

    # Run tests where the keys are the same.
    it('should merge one `object` with another', () ->
        merged = merge(testAs.object)(testBs.object)
        expect(merged.a).toBe(testBs.object.a)
        expect(merged.b).toBe(testAs.object.b)
        expect(merged.c).toBe(testAs.object.c)
    )

    it('should merge one `array` with another', () ->
        merged = merge(testAs.array)(testBs.array)
        expect(merged[0]).toBe(testBs.array[0])
        expect(merged[1]).toBe(testAs.array[1])
        expect(merged[2]).toBe(testAs.array[2])
    )

    testMerge('string', 'string')
    testMerge('number', 'number')
    testMerge('boolean', 'boolean')

)
