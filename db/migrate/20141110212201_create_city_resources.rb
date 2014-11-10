class CreateCityResources < ActiveRecord::Migration
  def change
    create_table :city_resources do |t|
      t.integer :wood
      t.integer :stone
      t.integer :food

      t.timestamps
    end
  end
end
