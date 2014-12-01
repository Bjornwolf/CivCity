Backend = require('./backend')
Gui = require('./components/game_dashboard')

class App
  constructor: ->
    @backend = new Backend()
    @gui = Gui()

  start: (node) ->
    @gui = React.render(@gui, node)
    @backend.getGameData()
      .then (readModel) =>
        @gui.setData(readModel.city)

module.exports = App