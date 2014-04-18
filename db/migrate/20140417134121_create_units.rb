class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.integer :user_id
      t.integer :building_id
      t.integer :floor_number
      t.string :side
      t.integer :unit_number
      t.integer :area
      t.integer :resident_count

      t.timestamps
    end
  end
end
