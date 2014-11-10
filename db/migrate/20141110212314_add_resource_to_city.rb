class AddResourceToCity < ActiveRecord::Migration
  def change
    add_column :cities, :resources_id, :integer
  end
end
