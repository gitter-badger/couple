# Typed Couple

```coffee
typedCouple = require('couple').typedCouple

a = {}
b = {}

typedCouple.object = (a, b) -> b
typedCouple.array = (a, b) -> b
typedCouple.string = (a, b) -> b
typedCouple.number = (a, b) -> b
typedCouple.boolean = (a, b) -> b
typedCouple.function = (a, b) -> b
typedCouple.regexp = (a, b) -> b

typedCouple(a)(b)
```
