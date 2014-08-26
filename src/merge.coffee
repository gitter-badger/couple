# Dependencies.
typedCouple = require('./couple').typed
type = require('./type')

# Merge API.
merge = typedCouple()

# Reference types.
merge.object = (a, b) ->
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

merge.array = (a, b) ->
    if type(a) is type(b)
        arr = b.map((value) -> value)
        a.forEach((value, index) ->
            arr[index] = merge(value)(b[index])
        )
        arr
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

# API.
module.exports = merge
