{div, span, br} = React.DOM

Resources = React.createClass
  displayName: 'Resources'

  render: ->
    div null,
      @foodCounter()
      @woodCounter()
      @stoneCounter()

  foodCounter: ->
    div
      className: 'col-md-2'
      style:
        textAlign: 'center'
      span
        style:
          fontSize: 17
          fontWeight: 'bold'
        "Food"
      br()
      @props.resources.food

  woodCounter: ->
    div
      className: 'col-md-2'
      style:
        textAlign: 'center'
      span
        style:
          fontSize: 17
          fontWeight: 'bold'
        "Wood"
      br()
      @props.resources.wood

  stoneCounter: ->
    div
      className: 'col-md-2'
      style:
        textAlign: 'center'
      span
        style:
          fontSize: 17
          fontWeight: 'bold'
        "Stone"
      br()
      @props.resources.stone

module.exports = Resources