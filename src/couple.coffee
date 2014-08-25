# Dependencies.
type = require('./type')

# Couple and "Typed Couple".
couple = (mod) -> (a) -> (b) -> mod(a, b)
couple.typed = () ->
    typedCouple = couple((a, b) ->
        typedCouple[type(a)](a, b)
    )

# API.
module.exports = couple
