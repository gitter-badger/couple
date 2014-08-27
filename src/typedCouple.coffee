# Dependencies.
couple = require('./couple')
type = require('./type')

# API.
module.exports = () ->
    typedCouple = couple((a, b) ->
        typedCouple[type(a)](a, b)
    )
