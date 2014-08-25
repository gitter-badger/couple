module.exports = (value) ->
    valueType = typeof value
    switch valueType
        when 'object'
            switch value.constructor
                when Array then 'array'
                when RegExp then 'regexp'
                else 'object'
        else valueType
