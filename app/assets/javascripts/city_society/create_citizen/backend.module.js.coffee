class Backend
  createCitizen: ->
    $.ajax
      url: '/cities/city_society/create_citizen'
      type: 'POST'
      dataType: 'JSON'
      data:{}
    .then (response) =>
      society: response.society
      resources: response.resources

module.exports = Backend