App = require('city_resources/app')
EventBus = require('modules/event_bus')

EventBus.on 'cityResourcesDivRendered', ->
  unless window.resourcesApp
    $(document).ready ->
      $('div.cityResources').each ->
        window.resourcesApp = new App()
        window.resourcesApp.start(@)