{h2, h4, div, ul, li} = React.DOM

City = React.createClass
  displayName: 'City'

  cityResources: ->
    @props.city.city_resource

  citySociety: ->
    @props.city.city_society

  render: ->
    div null,
      @name()
      div null,
        @resources()
        @society()

  name: ->
    h2 null, "Welcome in city " + @props.city.name + " our king!"

  resources: ->
    div null,
      h4 null, "Resources:"
      ul null,
        li null, "Food: " + @cityResources().food
        li null, "Wood: " + @cityResources().wood
        li null, "Stone: " + @cityResources().stone

  society: ->
    div null,
      h4 null, "Society:"
      ul null,
        li null, "Citizens: " + @citySociety().citizens
        li null, "Citizens working on Food: " + @citySociety().food_workers
        li null, "Citizens working on Wood: " + @citySociety().wood_workers
        li null, "Citizens working on Stone: " + @citySociety().stone_workers


module.exports = React.createFactory(City)

