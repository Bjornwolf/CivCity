class ModifyCitySociety < ActiveRecord::Migration
  def change
    remove_column :cities, :resources_id
    add_column :city_resources, :city_id, :integer
  end
end
