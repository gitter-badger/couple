define([
    '../src/field'
], (field) ->
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

        describe('extend', () ->
            beforeEach(() ->
                f.extend({
                    hello: 'world'
                    world: 'hello'
                })
            )

            it('should extend nothing', () ->
                expect(f({
                    hello: 'world'
                    world: 'hello'
                })).toBe(true)
            )

            it('should extend twice', () ->
                f.extend({
                    world: 'bonjour'
                    foo: 'bar'
                })

                expect(f({
                    hello: 'world'
                    world: 'bonjour'
                    foo: 'bar'
                })).toBe(true)
            )

            it('should extend states', () ->
                f.states([{
                    one: 'one'
                }, {
                    two: 'two'
                }])

                expect(f({
                    hello: 'world'
                    world: 'hello'
                    one: 'one'
                })).toBe(true)

                expect(f({
                    hello: 'world'
                    world: 'hello'
                    two: 'two'
                })).toBe(true)

                expect(f({
                    hello: 'world'
                    world: 'hello'
                    one: 'one'
                    two: 'two'
                })).toBe(false)

                expect(f({
                    hello: 'world'
                    world: 'hello'
                })).toBe(false)
            )
        )

        describe('default', () ->
            beforeEach(() ->
                f.default({
                    hello: 'world'
                })
            )

            it('should use default when property is not defined', () ->
                f.extend({
                    hello: 'world'
                    world: 'hello'
                })

                expect(f({
                    world: 'hello'
                })).toBe(true)
            )

            it('should not use default when property is defined', () ->
                f.extend({
                    hello: 'foobar'
                    world: 'hello'
                })

                expect(f({
                    hello: 'foobar'
                    world: 'hello'
                })).toBe(true)
            )
        )
    )
)
