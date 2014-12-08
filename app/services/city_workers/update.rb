module CityWorkers
  class Update
    def initialize(actor)
      @actor = actor
    end

    def call(form_data)
      form_data.validate!
      society = get_city_society
      society.food_workers = form_data.food_workers
      society.wood_workers = form_data.wood_workers
      society.stone_workers = form_data.stone_workers
      society.save!
      society
    end

    private
    attr_reader :actor

    def get_city_society
      City.find_by!(owner_id: actor.id).city_society
    end
  end
end