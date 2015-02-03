class Dispatcher
  constructor: (@backend, @gui, @eventBus) ->
    @setupEvents()
    @start()

  setupEvents: ->
    @eventBus.on 'nextTurn', (resources) =>
      @loadResources()

  start: ->
    @loadResources()

  loadResources: ->
    @backend.fetchResources().then (resources) =>
      @gui.setResources(resources)


module.exports = Dispatcher