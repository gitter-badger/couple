define = this.define or require('amdefine')(module)

define([
    './couple'
    './type'
], (couple, type) ->
    () ->
        typedCouple = couple((a, b) ->
            typedCouple[type(a)](a, b)
        )
)
