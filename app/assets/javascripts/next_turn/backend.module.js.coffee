class Backend
  nextTurn: ->
    $.ajax
      url: '/turn/next'
      type: 'GET'
      dataType: 'JSON'

module.exports = Backend