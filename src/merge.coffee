define = this.define or require('amdefine')(module)

define([
    './typedCouple'
    './type'
], (typedCouple, type) ->
    merge = typedCouple()

    # Reference types.
    merge.object =
    merge.array =
    merge.reference = (a, b) ->
        if type(a) is type(b)
            obj = {}

            bKeys = Object.keys(b)
            bKeys.forEach((key) ->
                obj[key] = b[key]
            )

            aKeys = Object.keys(a)
            aKeys.forEach((key) ->
                obj[key] = merge(a[key])(b[key])
            )

            obj
        else a

    # Primitive types.
    merge.number =
    merge.string =
    merge.boolean =
    merge.primitive = (a, b) -> a
    merge.undefined = (a, b) -> b

    # Operational types.
    merge.function = (a, b) -> a(b)
    merge.regexp = (a, b) -> a.test(b)

    merge
)
