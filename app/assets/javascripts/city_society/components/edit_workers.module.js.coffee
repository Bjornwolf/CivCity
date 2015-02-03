{div, label, input, button, h4} = React.DOM

EditWorkers = React.createClass
  displayName: 'EditWorkers'
  errors: {}

  getInitialState: ->
    foodWorkers: @props.society.food_workers
    woodWorkers: @props.society.wood_workers
    stoneWorkers: @props.society.stone_workers

  submit: ->
    @props.eventBus.publish 'workersUpdateRequested', @workers()
    @props.close()

  workers: ->
    foodWorkers: @state.foodWorkers
    woodWorkers: @state.woodWorkers
    stoneWorkers: @state.stoneWorkers

  submittable: ->
    @validate()
    @valid()

  onChange: (workersType, value) ->
    count = parseInt(value)
    if count >= 0 and @validateInput(workersType, count)
      state = {}
      state[workersType] = count
      @setState state

  validateInput: (workersType, count) ->
    workers = @workers()
    workers[workersType] = count
    @validateCitizens(workers)

  validateCitizens: (workers=@workers()) ->
    workersCount = Object.values(workers).sum()
    if @props.society.citizens >= workersCount
      delete @errors['citizens']
    else
      @errors['citizens'] = true

  validate: ->
    @validateCitizens()

  valid: ->
    Object.isEmpty(@errors)

  leftCitizens: ->
    workers = @workers()
    workersCount = Object.values(workers).sum()
    @props.society.citizens - workersCount

  render: ->
    div null,
      @header()
      @fields()
      @infoLabels()
      @buttons()

  header: ->
    h4 null, 'Edit Workers'

  fields: ->
    div null,
      @foodInput()
      @woodInput()
      @stoneInput()

  foodInput: ->
    div
      className: 'clearfix'
      label null, 'Food workers: '
      input
        type: 'number'
        min: 0
        max: @state.foodWorkers + @leftCitizens()
        style:
          width: 120
          marginLeft: 10
        name: 'food_workers'
        onChange: (e) => @onChange('foodWorkers', e.target.value)
        value: @state.foodWorkers

  woodInput: ->
    div
      className: 'clearfix'
      label null, 'Wood workers: '
      input
        type: 'number'
        min: 0
        max: @state.woodWorkers + @leftCitizens()
        style:
          width: 120
          marginLeft: 10
        name: 'wood_workers'
        onChange: (e) => @onChange('woodWorkers', e.target.value)
        value: @state.woodWorkers

  stoneInput: ->
    div
      className: 'clearfix'
      label null, 'Stone workers: '
      input
        type: 'number'
        min: 0
        max: @state.stoneWorkers + @leftCitizens()
        style:
          width: 120
          marginLeft: 10
        name: 'stone_workers'
        onChange: (e) => @onChange('stoneWorkers', e.target.value)
        value: @state.stoneWorkers

  infoLabels: ->
    div
      className: 'pull-left'
      if @leftCitizens() is 0
        "Workers maxed out!"
      else if @leftCitizens() < 0
        "Workers count can't be higher than citizens count!"

  buttons: ->
    div
      className: 'pull-right btn-group'
      style:
        marginRight: '9em'
      button
        type: 'button'
        className: 'btn btn-primary btn-xs'
        onClick: @submit
        disabled: !@submittable()
        'Save'
      button
        type: 'button'
        className: 'btn btn-default btn-xs'
        onClick: @props.close
        'Cancel'

module.exports = EditWorkers