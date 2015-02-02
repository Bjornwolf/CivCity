Backend = require('./backend')
CityWorkers = require('city_workers/app')
Dispatcher = require('./dispatcher')
EventBus = require('modules/event_bus')
Gui = require('./components/game_dashboard')

class App
  constructor: ->
    @backend = new Backend()
    @eventBus = EventBus
    @gui = Gui(eventBus: @eventBus)

  start: (node) ->
    @gui = React.render(@gui, node)
    @dispatcher = new Dispatcher(@backend, @gui, @useCase, @eventBus)
    @backend.getGameData().then (city) =>
      @gui.setCity(city)

module.exports = App