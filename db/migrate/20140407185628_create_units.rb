class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.integer :building_id
      t.integer :floor
      t.integer :resident_id
      t.integer :area

      t.timestamps
    end
  end
end
