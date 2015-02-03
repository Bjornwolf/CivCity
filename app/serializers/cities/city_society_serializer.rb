module Cities
  class CitySocietySerializer < ActiveModel::Serializer
    attributes :id, :citizens, :food_workers, :wood_workers, :stone_workers
  end
end
