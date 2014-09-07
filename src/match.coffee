define = this.define || require('amdefine')(module)

define([
    './typedCouple'
    './type'
], (typedCouple, type) ->
    # Match API.
    match = typedCouple()

    # Reference types.
    match.object =
    match.array =
    match.reference = (a, b) ->
        if type(a) is type(b)
            keys = Object.keys(a)
            keys.filter((key) ->
                match(a[key])(b[key])
            ).length is keys.length
        else false

    # Primitive types.
    match.number =
    match.string =
    match.boolean =
    match.primitive = (a, b) -> a is b
    match.undefined = (a, b) -> true

    # Operational types.
    match.function = (a, b) -> a(b)
    match.regexp = (a, b) -> a.test(b)

    match
)
