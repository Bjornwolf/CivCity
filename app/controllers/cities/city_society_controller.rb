module Cities
  class CitySocietyController < ApplicationController
    def index
      respond_with current_city_society,
                   serializer: CitySocietySerializer
    end

    def create_citizen
      society, resources = create_citizen_service.(current_city)
      society = CitySocietySerializer.new(society, root: false)
      resources = CityResourcesSerializer.new(resources, root: false)
      render json: {
                society: society,
                resources: resources
             }
    end

    private
    def current_city_society
      current_city.city_society
    end

    def create_citizen_service
      CitiesSociety::CreateCitizen.new
    end
  end
end