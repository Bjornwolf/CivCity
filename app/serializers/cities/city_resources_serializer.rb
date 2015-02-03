module Cities
  class CityResourcesSerializer < ActiveModel::Serializer
    attributes :id, :food, :wood, :stone
  end
end