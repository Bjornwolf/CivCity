module CitiesSociety
  class CreateCitizen
    CITIZEN_COST = 150
    class NotEnoughFood < StandardError ; end

    def call(city)
      resources = city.city_resource
      society = city.city_society
      validate_city_resources(resources)
      ActiveRecord::Base.transaction do
        update_materials(resources)
        upgrade_society(society)
      end
      [society, resources]
    end

    private
    def validate_city_resources(city_resources)
      raise NotEnoughFood if city_resources.food < CITIZEN_COST
    end

    def update_materials(city_resources)
      city_resources.food -= CITIZEN_COST
      city_resources.save!
    end

    def upgrade_society(city_society)
      city_society.citizens += 1
      city_society.save!
    end
  end
end
