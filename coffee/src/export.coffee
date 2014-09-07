if typeof define isnt 'function' then define = require('amdefine')(module)

define([
    './couple'
    './typedCouple'
    './field'
    './match'
    './merge'
    './type'
    './validate'
], (couple, typedCouple, field, match, merge, type, validate) ->
    couple: couple
    typedCouple: typedCouple
    field: field
    match: match
    merge: merge
    type: type
    validate: validate
)
