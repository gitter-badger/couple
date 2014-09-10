# Type
This is more of a utility function, but it is exposed as it can be useful externally.

```coffee
type = require('couple').type

type({}) # Returns 'object'
type([]) # Returns 'array'
type(0) # Returns 'number'
type('') # Returns 'string'
type(false) # Returns 'boolean'
type(() -> null) # Returns 'function'
type(/a/) # Returns 'regexp'
```
