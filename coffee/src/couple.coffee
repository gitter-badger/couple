if typeof define isnt 'function' then define = require('amdefine')(module)

define([], () ->
    (mod) -> (a) -> (b) -> mod(a, b)
)
