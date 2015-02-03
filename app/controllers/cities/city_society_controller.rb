module Cities
  class CitySocietyController < ApplicationController
    def index
      respond_with current_city_society,
                   serializer: CitySocietySerializer
    end

    private
    def current_city_society
      current_city.city_society
    end
  end
end