App = require('game_dashboard/app')

$(document).ready ->
  $('#game').each ->
    window.app = new App()
    window.app.start(@)