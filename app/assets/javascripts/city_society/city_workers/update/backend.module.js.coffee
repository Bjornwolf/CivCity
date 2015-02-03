class Backend
  updateWorkers: (workers) ->
    $.ajax
      url: '/city_workers/workers'
      type: 'PUT'
      dataType: 'JSON'
      data:
        workers:
          food_workers: workers.foodWorkers
          wood_workers: workers.woodWorkers
          stone_workers: workers.stoneWorkers
    .then (response) =>
      response.city_society

module.exports = Backend