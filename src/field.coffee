merge = require('./merge')
validate = require('./validate')

field = () ->
    optional = false
    states = []
    extend = {}
    def = {}

    self = (value) ->
        actualValue = merge(def)(value)

        if not value? then optional
        else if states.length > 0
            states.filter((state) ->
                state = merge(state)(extend)

                # Try to validate value with state.
                try
                    validate(state)(actualValue)
                    true
                catch error
                    false
            ).length is 1
        else validate(extend)(actualValue)

    self.extend = (obj) -> extend = merge(obj)(extend)
    self.states = (newStates) -> states.concat(newStates)
    self.required = (value) -> optional = if value? then not value else false
    self.optional = (value) -> optional = if value? then value else true
    self.default = (obj) -> def = obj

# API.
module.exports = field
