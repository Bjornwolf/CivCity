{div, span, a} = React.DOM
City = React.createFactory require('./city')

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
            eventBus: @props.eventBus
          a
            href: '/turn/next'
            "Next Turn"
      else if @state.city is null
        a
          href: '/cities/new'
          "Create your city"
      else
        span null, 'Loading'

module.exports = GameDashboard