class Backend
  fetchResources: ->
    $.ajax
      url: '/cities/city_resources'
      type: 'GET'
      dataType: 'JSON'
    .then (response) =>
      response.city_resources;

module.exports = Backend