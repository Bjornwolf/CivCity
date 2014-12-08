class Dispatcher
  constructor: (@backend, @gui, @useCase, @eventBus) ->
    @setupEvents()

  start: ->
    @backend.getGameData().then (response) => @useCase.setCity(response.city)

  setupEvents: ->
    @eventBus.on 'cityUpdated', (city) => @gui.setData(city)
    @eventBus.on 'workersChanged', (society) => @useCase.setCitySociety(society)

module.exports = Dispatcher