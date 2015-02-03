{div, h2, h3} = React.DOM

Society = React.createFactory require('./components/society')

CitySociety = React.createClass
  displayName: 'CitySociety'

  getInitialState: ->
    society: null

  setSociety: (society) ->
    @setState society: society

  render: ->
    div null,
      h2 null, 'City Society'
      if @state.society
        @society()
      else
        @loading()

  society: ->
    Society
      eventBus: @props.eventBus
      society: @state.society

  loading: ->
    h3 null, "Loading..."

module.exports = CitySociety