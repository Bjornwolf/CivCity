EventBus = require('modules/event_bus')
Backend = require('./backend')

class App
  constructor: ->
    @eventBus = EventBus
    @backend = new Backend()

    @setupEvents()

  setupEvents: ->
    @eventBus.on 'workersChangeRequested', (society) =>
      @backend.changeWorkersCount(society)
      .success (response) =>
        @eventBus.publish 'workersChanged', (response.city_society)

module.exports = App