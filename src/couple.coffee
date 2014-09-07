define = this.define || require('amdefine')(module)

define([], () ->
    (mod) -> (a) -> (b) -> mod(a, b)
)
