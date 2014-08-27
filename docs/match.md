# Match

```coffee
match = require('couple').match

match({
    string: 'hello world'
    number: 10
    boolean: false
    array: [20]
    string2: (value) -> value is 'foobar'
    string3: /foobaz/
})({
    string: 'hello world'
    number: 10
    boolean: false
    array: [20]
    string2: 'foobar'
    string3: 'foobaz'
}) # Returns true.
```
