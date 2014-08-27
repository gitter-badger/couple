merge = require('./merge')
validate = require('./validate')

field = () ->
    optional = false
    states = []
    extend = {}
    def = {}

    self = (value) ->
        value = merge(def)(value)

        if not value? then optional
        else if states.length > 0
            states.filter((state) ->
                state = merge(state)(extend)

                # Try to validate value with state.
                try
                    validate(state)(value)
                    true
                catch error
                    false
            ).length is 1
        else validate(extend)(value)

    self.extend = (obj) -> extend = merge(obj)(extend)
    self.states = (newStates) -> states.concat(newStates)
    self.required = (value) -> optional = if value? then not value else false
    self.optional = (value) -> optional = if value? then value else true
    self.default = (obj) -> def = obj

# API.
module.exports = field
