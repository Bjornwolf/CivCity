Backend = require('./backend')
Dispatcher = require('./dispatcher')
EventBus = require('modules/event_bus')
Gui = require('./components/game_dashboard')

NextTurn = require('next_turn/app')

class App
  constructor: ->
    @backend = new Backend()
    @eventBus = EventBus
    @gui = Gui(eventBus: @eventBus)

  start: (node) ->
    @nextTurn = new NextTurn()
    @gui = React.render(@gui, node)
    @dispatcher = new Dispatcher(@backend, @gui, @useCase, @eventBus)
    @backend.getGameData().then (city) =>
      @gui.setCity(city)

module.exports = App