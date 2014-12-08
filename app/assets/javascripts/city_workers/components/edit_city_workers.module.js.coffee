{div, ul, li, button, input} = React.DOM

EditCityWorkers = React.createClass
  displayName: 'EditCityWorkers'

  getInitialState: ->
    foodWorkers: @citySociety().food_workers
    woodWorkers: @citySociety().wood_workers
    stoneWorkers: @citySociety().stone_workers

  onChange: (workersType, amount) ->
    state = {}
    state[workersType] = parseInt(amount) or 0
    @setState state

  onSave: ->
    @props.eventBus.publish(
      'workersChangeRequested'
      citizens: @citySociety().citizens
      foodWorkers: @state.foodWorkers
      woodWorkers: @state.woodWorkers
      stoneWorkers: @state.stoneWorkers
    )
    @props.close()

  citySociety: ->
    @props.citySociety

  render: ->
    div null,
      @inputs()
      @buttons()

  inputs: ->
    ul null,
      li null,
        "Citizens working on Food: "
        input
          name: "foodWorkers"
          onChange: (e) => @onChange('foodWorkers', e.target.value)
          value: @state.foodWorkers
      li null,
        "Citizens working on Wood: "
        input
          name: "woodWorkers"
          onChange: (e) => @onChange('woodWorkers', e.target.value)
          value: @state.woodWorkers
      li null,
        "Citizens working on Stone: "
        input
          name: "stoneWorkers"
          onChange: (e) => @onChange('stoneWorkers', e.target.value)
          value: @state.stoneWorkers

  buttons: ->
    [
      button
        onClick: @onSave
        "Save"
      button
        onClick: @props.close
        "Cancel"
    ]

module.exports = EditCityWorkers
