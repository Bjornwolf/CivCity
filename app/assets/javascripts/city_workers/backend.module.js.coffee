class Backend
  changeWorkersCount: (society) ->
    $.ajax
      url: '/city_workers/workers'
      dataType: 'JSON'
      type: 'POST'
      data:
        workers:
          citizens: society.citizens
          food_workers: society.foodWorkers
          wood_workers: society.woodWorkers
          stone_workers: society.stoneWorkers

module.exports = Backend