define = this.define or require('amdefine')(module)

define([], () ->
    (mod) -> (a) -> (b) -> mod(a, b)
)
