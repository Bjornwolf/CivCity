{div, ul, li, a} = React.DOM
EditCityWorkers = require('./edit_city_workers')

CityWorkers = React.createClass
  displayName: 'CityWorkers'

  getInitialState: ->
    editingMode: false

  turnOnEditingMode: ->
    @setState editingMode: true

  turnOffEditingMode: ->
    @setState editingMode: false

  citySociety: ->
    @props.citySociety

  render: ->
    if @state.editingMode
      EditCityWorkers
        citySociety: @citySociety()
        close: @turnOffEditingMode
        eventBus: @props.eventBus
    else
      div null,
        ul null,
          li null, "Citizens working on Food: " + @citySociety().food_workers
          li null, "Citizens working on Wood: " + @citySociety().wood_workers
          li null, "Citizens working on Stone: " + @citySociety().stone_workers
        a
          onClick: @turnOnEditingMode
          "Edit"

module.exports = CityWorkers