class Dispatcher
  constructor: (@backend, @gui, @eventBus) ->
    @setupEvents()

  setupEvents: ->
    @eventBus.on 'societyUpdated', (society) =>
      @gui.setSociety(society)
    @eventBus.on 'nextTurn', (society) =>
      @loadResources()

  start: ->
    @loadResources()

  loadResources: ->
    @backend.fetchSociety().then (society) =>
      @gui.setSociety(society)


module.exports = Dispatcher