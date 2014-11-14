class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.integer :turn_number, default: 1
      t.references :city

      t.timestamps
    end

    City.all.each do |c|
      c.turn = Turn.create
    end
  end
end
