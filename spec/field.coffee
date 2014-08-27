field = require('../src/field')

# Tests field.
describe('field', () ->
    f = null

    beforeEach(() ->
        f = field()
    )

    describe('optional', () ->
        it('should not require validation when optional', () ->
            f.optional()
            expect(f(undefined)).toBe(true)
        )

        it('should require validation when not optional', () ->
            f.optional(false)
            expect(f(undefined)).toBe(false)
        )
    )

    describe('required', () ->
        it('should not require validation when optional', () ->
            f.required(false)
            expect(f(undefined)).toBe(true)
        )

        it('should require validation when not optional', () ->
            f.required()
            expect(f(undefined)).toBe(false)
        )
    )

    describe('states', () ->
        beforeEach(() ->
            f.states([0, 1])
        )

        it('should validate if in one of the states', () ->
            expect(f(0)).toBe(true)
            expect(f(1)).toBe(true)
        )

        it('shouldn\'t validate if not in one of the states', () ->
            expect(f(-1)).toBe(false)
            expect(f({})).toBe(false)
            expect(f([])).toBe(false)
            expect(f(true)).toBe(false)
            expect(f('')).toBe(false)
        )
    )


)
