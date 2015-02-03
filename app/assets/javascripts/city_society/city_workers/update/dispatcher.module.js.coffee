class Dispatcher
  constructor: (@backend, @eventBus) ->
    @setupEvents()

  setupEvents: ->
    @eventBus.on 'workersUpdateRequested', (workers) =>
      @backend.updateWorkers(workers)
      .then (society) =>
        @eventBus.publish 'societyUpdated', society

module.exports = Dispatcher