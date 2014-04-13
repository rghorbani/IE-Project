class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.integer :building_id
      t.integer :formula
      t.integer :unit_id
      t.integer :rate

      t.timestamps
    end
  end
end
