module Cities
  class CurrentUserCityQuery
    def initialize(actor)
      @actor = actor
    end

    def call
      build_city(city)
    end

    private
    attr_reader :actor

    def city
      City.where(owner_id: actor.id).first
    end

    def build_city(city)
      CitySerializer.new(city, root: :city).to_json
    end
  end
end