class Backend
  getGameData: ->
    $.ajax
      url: '/cities/current'
      type: 'GET'
      dataType: 'JSON'

module.exports = Backend