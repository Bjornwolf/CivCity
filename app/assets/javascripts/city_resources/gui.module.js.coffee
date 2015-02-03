{div, h2, h3} = React.DOM
Resources = React.createFactory require('./components/resources')

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
    Resources
      resources: @state.resources

  loading: ->
    h3 null, "Loading..."

module.exports = CityResources