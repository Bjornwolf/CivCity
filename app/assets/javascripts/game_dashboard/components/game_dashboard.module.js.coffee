{div, span, a} = React.DOM
City = require('./city')

GameDashboard = React.createClass
  displayName: 'GameDashboard'

  getInitialState: ->
    city: null

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
      else
        span null, 'Loading'

module.exports = React.createFactory(GameDashboard)