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


)
