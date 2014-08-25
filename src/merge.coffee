# Dependencies.
typedCouple = require('./couple').typed
type = require('./type')

# Merge API.
merge = typedCouple()

# Reference types.
merge.object = (a, b) ->
    if type(a) is type(b)
        keys = Object.keys(a)
        keys.forEach((key) ->
            merge(a[key])(b[key])
        ).length
    else b

merge.array = (a, b) ->
    if type(a) is type(b)
        a.forEach((value, index) ->
            merge(value)(b[index])
        ).length
    else b

# Primitive types.
merge.number =
merge.string =
merge.boolean =
merge.primitive = (a, b) -> b

# Operational types.
merge.function = (a, b) -> a(b)
merge.regexp = (a, b) -> a.test(b)

# API.
module.exports = merge
