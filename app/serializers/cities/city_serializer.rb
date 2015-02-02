module Cities
  class CitySerializer < ActiveModel::Serializer
    attributes :id, :name
  end
end