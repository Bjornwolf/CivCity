module Cities
  class CurrentCityResourcesQuery
    def call(city)
      resources = city.city_resource
      build_resources(resources)
    end

    private
    def build_resources(resources)
      CityResourcesSerializer.new(resources)
    end
  end
end