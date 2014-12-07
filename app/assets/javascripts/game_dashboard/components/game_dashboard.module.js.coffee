{div, span, a} = React.DOM
City = require('./city')

GameDashboard = React.createClass
  displayName: 'GameDashboard'

  getInitialState: ->
    city: undefined

  setData: (city) ->
    @setState city: city

  render: ->
    div null,
      if @state.city
        div null,
          City
            city: @state.city
          a
            href: '/turn/next'
            "Next Turn"
      else if @state.city is null
        a
          href: '/cities/new'
          "Create your city"
      else
        span null, 'Loading'

module.exports = React.createFactory(GameDashboard)