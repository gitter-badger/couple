# Dependencies.
typedCouple = require('./couple').typed
type = require('./type')

# Match API.
match = typedCouple()

# Reference types.
match.object = (a, b) ->
    if type(a) is type(b)
        keys = Object.keys(a)
        keys.filter((key) ->
            match(a[key])(b[key])
        ).length is keys.length
    else false

match.array = (a, b) ->
    if type(a) is type(b)
        a.filter((value, index) ->
            match(value)(b[index])
        ).length is a.length
    else false

# Primitive types.
match.number =
match.string =
match.boolean =
match.primitive = (a, b) -> a is b

# Operational types.
match.function = (a, b) -> a(b)
match.regexp = (a, b) -> a.test(b)

# API.
module.exports = match
