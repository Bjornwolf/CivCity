module Cities
  class CityResourcesController < ApplicationController
    def index
      respond_with current_city_resources_query.(current_city)
    end

    private
    def current_city_resources_query
      CurrentCityResourcesQuery.new
    end
  end
end