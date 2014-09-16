define = this.define or require('amdefine')(module)

define([
    './merge'
    './validate'
], (merge, validate) ->
    () ->
        optional = false
        states = []
        extend = {}
        def = undefined

        self = (value) ->
            mergedValue = merge(value)(def)

            if not value? then optional
            else if states.length > 0
                states.filter((state) ->
                    state = merge(state)(extend)

                    # Try to validate value with state.
                    try
                        validate(state)(mergedValue)
                    catch error
                        false
                ).length is 1
            else validate(extend)(mergedValue)

        self.extend = (obj) ->
            extend = merge(obj)(extend)
            self
        self.states = (newStates) ->
            states = states.concat(newStates)
            self
        self.optional = (value) ->
            optional = value
            self
        self.default = (obj) ->
            def = obj
            self

        self
)
