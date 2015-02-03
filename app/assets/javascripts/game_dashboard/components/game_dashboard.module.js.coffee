{div, span, a, h1} = React.DOM

GameDashboard = React.createClass
  displayName: 'GameDashboard'

  componentDidUpdate: ->
    @props.eventBus.publish 'cityResourcesDivRendered'
    @props.eventBus.publish 'citySocietyDivRendered'
    @props.eventBus.publish 'cityInfrastructureDivRendered'

  getInitialState: ->
    city: undefined

  setCity: (city) ->
    @setState city: city

  render: ->
    if !@state.city
      @loading()
    else
      @dashboardSkeleton()

  loading: ->
    h1
      style:
        textAlign: 'center'
        marginTop: '2em'
      "Loading..."

  dashboardSkeleton: ->
    div null,
      @dashboardHeader()
      @gameInfrastructure()

  dashboardHeader: ->
    div
      className: 'row'
      div
        className: 'pull-right'
        style:
          marginTop: '2.4em'
        a
          href: '/credentials/sign_out'
          "Sign Out"
      h1
        style:
          display: 'inline-block'
        "Welcome to your city #{@state.city.name}, our king!"

  gameInfrastructure: ->
    div
      className: 'row'
      @leftColumn()
      @rightColumn()

  leftColumn: ->
    div
      className: 'col-md-6'
      div
        className: 'cityResources clearfix'
        style: marginBottom: 20
      div
        className: 'citySociety clearfix'

  rightColumn: ->
    div
      className: 'col-md-6'
      div
        className: 'cityInfrastructure'

module.exports = GameDashboard