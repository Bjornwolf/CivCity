App = require('city_society/app')
EventBus = require('modules/event_bus')

EventBus.on 'citySocietyDivRendered', ->
  unless window.societyApp
    $(document).ready ->
      $('div.citySociety').each ->
        window.societyApp = new App()
        window.societyApp.start(@)