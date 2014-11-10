class City < ActiveRecord::Base
  belongs_to :user
  belongs_to :resources, class_name: "CityResource", foreign_key: :resources_id
end
