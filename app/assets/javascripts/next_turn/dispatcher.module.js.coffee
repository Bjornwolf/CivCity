class Dispatcher
  constructor: (@backend, @eventBus) ->
    @setupEvents()

  setupEvents: ->
    @eventBus.on 'nextTurnRequested', =>
      @backend.nextTurn()
      .then =>
        @eventBus.publish 'nextTurn'

module.exports = Dispatcher