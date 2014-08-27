# Merge

```coffee
merge = require('couple').merge

merge({
    a: 'a one'
    b: 'b one'
})({
    b: 'b two'
    c: 'c two'
})

###
Returns `{
  a: 'a one'
  b: 'b one'
  c: 'c two'
}`.
###
```
