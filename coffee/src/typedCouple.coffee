if typeof define isnt 'function' then define = require('amdefine')(module)

define([
    './couple'
    './type'
], (couple, type) ->
    () ->
        typedCouple = couple((a, b) ->
            typedCouple[type(a)](a, b)
        )
)
