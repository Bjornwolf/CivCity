class City < ActiveRecord::Base
  belongs_to :user
  has_one :turn
  has_one :city_resource
  has_one :city_society
end
