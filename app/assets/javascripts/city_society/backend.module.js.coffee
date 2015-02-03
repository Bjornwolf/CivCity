class Backend
  fetchSociety: ->
    $.ajax
      url: '/cities/city_society'
      type: 'GET'
      dataType: 'JSON'
    .then (response) =>
      response.city_society

module.exports = Backend