define([
    './typedCouple'
    './type'
    './match'
], (typedCouple, type, match) ->
    # Validate API.
    validate = typedCouple()

    # Reference types.
    validate.object =
    validate.array =
    validate.reference = (a, b) ->
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

    # Primitive types.
    validate.number =
    validate.string =
    validate.boolean =
    validate.primitive = match.primitive
    validate.undefined = match.undefined

    # Operational types.
    validate.function = match.function
    validate.regexp = match.regexp

    validate
)
