class Dispatcher
  constructor: (@backend, @gui, @eventBus) ->
    @setupEvents()

  setupEvents: ->
    @eventBus.on 'resourcesUpdated', (resources) =>
      @gui.setResources(resources)
    @eventBus.on 'nextTurn', (resources) =>
      @loadResources()

  start: ->
    @loadResources()

  loadResources: ->
    @backend.fetchResources().then (resources) =>
      @gui.setResources(resources)


module.exports = Dispatcher