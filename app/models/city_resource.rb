class CityResource < ActiveRecord::Base
  validates :food, numericality: {greater_than_or_equal_to: 0}
  validates :wood, numericality: {greater_than_or_equal_to: 0}
  validates :stone, numericality: {greater_than_or_equal_to: 0}
end
