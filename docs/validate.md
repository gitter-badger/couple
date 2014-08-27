# Validate

```coffee
validate = require('couple').validate

validate({
    string1: 'hello world'
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
}) # Returns true.

validate({
    string1: 'hello uk'
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
