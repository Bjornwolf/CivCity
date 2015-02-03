EventBus = require('modules/event_bus')
Backend = require('./backend')
Dispatcher = require('./dispatcher')

class App
  @eventBus = EventBus
  @backend = new Backend()
  @dispatcher = new Dispatcher(@backend, @eventBus)

module.exports = App