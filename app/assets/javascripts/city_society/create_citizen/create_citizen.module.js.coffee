{div, button} = React.DOM

CreateCitizen = React.createClass
  displayName: 'CreateCitizen'

  createCitizen: ->
    @props.eventBus.publish 'createCitizenRequested'

  render: ->
    div
      style:
        clear: 'both'
        display: 'block'
        marginTop: 10
      button
        className: 'btn btn-primary btn-sm clearfix'
        style:
          marginRight: 10
        disabled: @props.food < 150
        onClick: @createCitizen
        'Add Citizen'
      "Cost: 150 food"

module.exports = CreateCitizen