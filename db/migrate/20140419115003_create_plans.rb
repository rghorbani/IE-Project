class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.integer :building_id
      t.string :name
      t.integer :number

      t.timestamps
    end
  end
end
