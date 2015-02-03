{div, h2, h3} = React.DOM
Resources = React.createFactory require('./components/resources')
CreateCitizen = React.createFactory require('city_society/create_citizen/create_citizen')

CityResources = React.createClass
  displayName: 'CityResources'

  getInitialState: ->
    resources: null

  setResources: (resources) ->
    @setState resources: resources

  render: ->
    div null,
      h2 null, 'City Resources'
      if @state.resources
        @resources()
      else
        @loading()

  resources: ->
    div null,
      Resources
        resources: @state.resources
      CreateCitizen
        eventBus: @props.eventBus
        food: @state.resources.food

  loading: ->
    h3 null, "Loading..."

module.exports = CityResources