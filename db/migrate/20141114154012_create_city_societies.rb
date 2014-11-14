class CreateCitySocieties < ActiveRecord::Migration
  def change
    create_table :city_societies do |t|
      t.integer :citizens,      default: 10
      t.integer :food_workers,  default: 5
      t.integer :wood_workers,  default: 0
      t.integer :stone_workers, default: 0
      t.integer :city_id, null: false

      t.timestamps
    end

    City.all.each do |c|
      c.city_society = CitySociety.create
    end
  end
end
