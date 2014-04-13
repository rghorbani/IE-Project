class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.integer :floor_cnt
      t.integer :units_cnt
      t.integer :manager_id
      t.text :general_info

      t.timestamps
    end
  end
end
