class ChangeResourcesFields < ActiveRecord::Migration
  def change
    change_column :city_resources, :wood, :integer, default: 5
    change_column :city_resources, :food, :integer, default: 10
    change_column :city_resources, :stone, :integer, default: 0
    change_column :city_resources, :city_id, :integer, null: false

    City.all.each do |c|
      c.city_resource = CityResource.new
      c.save!
    end
  end
end
