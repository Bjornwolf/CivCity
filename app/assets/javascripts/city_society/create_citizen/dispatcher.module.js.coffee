class Dispatcher
  constructor: (@backend, @eventBus) ->
    @setupEvents()

  setupEvents: ->
    @eventBus.on 'createCitizenRequested', =>
      @backend.createCitizen()
      .then (response) =>
        @eventBus.publish 'societyUpdated', response.society
        @eventBus.publish 'resourcesUpdated', response.resources

module.exports = Dispatcher