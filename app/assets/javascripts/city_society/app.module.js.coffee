Backend = require('./backend')
Dispatcher = require('./dispatcher')
EventBus = require('modules/event_bus')
Gui = require('./gui')

CityWorkers = require('city_society/city_workers/update/app')

class App
  constructor: ->
    @eventBus = EventBus
    @backend = new Backend()
    @gui = Gui(eventBus: @eventBus)

  start: (node) ->
    @cityWorkers = new CityWorkers()
    @gui = React.render(@gui, node)
    @dispatcher = new Dispatcher(@backend, @gui, @eventBus)
    @dispatcher.start()

module.exports = App