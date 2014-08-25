merge = require('./merge')
validate = require('./validate')

field = () ->
    required = true
    states = []
    extend = {}
    def = {}

    self = (value) ->
        value = merge(def)(value)

        states.filter((state) ->
            state = merge(state)(extend)

            # Try to validate value with state.
            try
                validate(state)(value)
                true
            catch error
                false
        ).length is 1 or not required

    self.extend = (obj) -> extend = obj
    self.states = (newStates) -> states.concat(newStates)
    self.required = (value) -> required = value
    self.optional = (value) -> required = not value
    self.default = (obj) -> def = obj

# API.
module.exports = field
