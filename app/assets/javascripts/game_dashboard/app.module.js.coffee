Backend = require('./backend')
CityWorkers = require('city_workers/app')
Dispatcher = require('./dispatcher')
EventBus = require('modules/event_bus')
Gui = require('./components/game_dashboard')

class App
  constructor: ->
    @backend = new Backend()
    @eventBus = EventBus
    @gui = Gui(eventBus: @eventBus)
    @useCase = new UseCase(@eventBus)

    @cityWorkers = new CityWorkers()

  start: (node) ->
    @gui = React.render(@gui, node)
    @dispatcher = new Dispatcher(@backend, @gui, @useCase, @eventBus)
    @dispatcher.start()

class UseCase
  constructor: (@eventBus) ->

  setCity: (@city) ->
    @update()

  setCitySociety: (citySociety)  ->
    @city.city_society = citySociety
    @update()

  update: ->
    @eventBus.publish 'cityUpdated', @city

module.exports = App