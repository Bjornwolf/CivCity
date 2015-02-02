class Backend
  getGameData: ->
    $.ajax
      url: '/cities/current'
      type: 'GET'
      dataType: 'JSON'
    .then (response) =>
      response.city

module.exports = Backend