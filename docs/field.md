# Field
Field provides some utility functions for validation allowing for defaults, optional fields, and states.

```coffee
validate = require('couple').validate
field = require('couple').field

validate({
    string1: field().optional(true).states['hello', 'world'].default('hello')
    number: 10
    boolean: false
    array: [20]
    string2: (value) -> value is 'foobar'
    string3: /foobaz/
})({
    number: 10
    boolean: false
    array: [20]
    string2: 'foobar'
    string3: 'foobaz'
}) # Returns true.

validate({
    string1: field().optional(true).states['hello', 'world'].default('hello')
    number: 10
    boolean: false
    array: [20]
    string2: (value) -> value is 'foobar'
    string3: /foobaz/
})({
    string1: 'world'
    number: 10
    boolean: false
    array: [20]
    string2: 'foobar'
    string3: 'foobaz'
}) # Returns true.

validate({
    string1: field().optional(true).states['hello', 'world'].default('hello')
    number: 10
    boolean: false
    array: [20]
    string2: (value) -> value is 'foobar'
    string3: /foobaz/
})({
    string1: 'hello world'
    number: 10
    boolean: false
    array: [20]
    string2: 'foobar'
    string3: 'foobaz'
}) # Throws exception notifying the user that it expected a valid `string1`.
```
