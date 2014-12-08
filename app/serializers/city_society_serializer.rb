class CitySocietySerializer < ActiveModel::Serializer
  attributes :citizens, :food_workers, :wood_workers, :stone_workers
end
