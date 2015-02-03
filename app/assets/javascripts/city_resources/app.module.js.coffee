Backend = require('./backend')
Dispatcher = require('./dispatcher')
EventBus = require('modules/event_bus')
Gui = require('./gui')

class App
  constructor: ->
    @eventBus = EventBus
    @backend = new Backend()
    @gui = Gui(eventBus: @eventBus)

  start: (node) ->
    @gui = React.render(@gui, node)
    @dispatcher = new Dispatcher(@backend, @gui, @eventBus)
    @dispatcher.start()

module.exports = App