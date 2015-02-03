{div, p, ul, li, a} = React.DOM
EditWorkers = React.createFactory require('city_society/city_workers/update/edit_workers')

Society = React.createClass
  displayName: "Society"

  getInitialState: ->
    editWorkers: false

  openEditWorkers: ->
    @setState editWorkers: true

  closeEditWorkers: ->
    @setState editWorkers: false

  society: ->
    @props.society

  render: ->
    div null,
      @citizens()
      if @state.editWorkers
        EditWorkers
          eventBus: @props.eventBus
          close: @closeEditWorkers
          society: @society()
      else
        @workers()

  citizens: ->
    p null, "Citizens: " + @society().citizens + " (#{@unemployed()} unemployed)"

  unemployed: ->
    @society().citizens - @society().food_workers - @society().wood_workers - @society().stone_workers

  turnOnEditWorkersButton: ->
    a
      className: 'pull-right'
      style:
        marginRight: '12em'
      onClick: @openEditWorkers
      "[Edit]"

  workers: ->
    div null,
      ul null,
        li null, "Food Workers: #{@society().food_workers} (#{@foodGrowth()})"
        li null, "Wood Workers: #{@society().wood_workers} (#{@woodGrowth()})"
        li null, "Stone Workers: #{@society().stone_workers} (#{@stoneGrowth()})"
      @turnOnEditWorkersButton()

  foodGrowth: ->
    "#{@society().food_workers} x 5 = #{@society().food_workers * 5} food units per turn"

  woodGrowth: ->
    "#{@society().wood_workers} x 2 = #{@society().wood_workers * 2} wood units per turn"

  stoneGrowth: ->
    "#{@society().stone_workers} x 1 = #{@society().stone_workers * 1} stone units per turn"

module.exports = Society