# Dependencies.
typedCouple = require('./couple').typed
type = require('./type')
match = require('./match')

# Validate API.
validate = typedCouple()

# Reference types.
validate.object = (a, b) ->
    if type(a) is type(b)
        aKeys = Object.keys(a)
        bKeys = Object.keys(b)
        aJoinedKeys = aKeys.sort().join(',')
        bJoinedKeys = bKeys.sort().join(',')

        # Validate keys.
        if (aKeys.length isnt bKeys.length) or (aJoinedKeys isnt bJoinedKeys)
            throw new Error("Invalid keys. Expected keys from `#{aJoinedKeys}`, but found `#{bJoinedKeys}`.")
        else
            aKeys.filter((key) ->
                if validate(a[key])(b[key])
                    true
                else
                    throw new Error("Expected a valid #{key}, but found `#{a[key]}`.")
            ).length is aKeys.length
    else
        throw new Error("Expected an `object`, but found `#{b}`.")

validate.array = match.array

# Primitive types.
validate.number =
validate.string =
validate.boolean =
validate.primitive = match.primitive
validate.undefined = match.undefined

# Operational types.
validate.function = match.function
validate.regexp = match.regexp

# API.
module.exports = validate
