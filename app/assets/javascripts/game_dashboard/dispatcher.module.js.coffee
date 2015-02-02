class Dispatcher
  constructor: (@backend, @gui, @useCase, @eventBus) ->
    @setupEvents()

  setupEvents: ->
    @eventBus.on 'cityUpdated', (city) => @gui.setData(city)

module.exports = Dispatcher