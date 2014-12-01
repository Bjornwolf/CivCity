module Cities
  class CitySerializer < ActiveModel::Serializer
    attributes :id, :name

    has_one :owner
    has_one :turn
    has_one :city_resource
    has_one :city_society
  end
end