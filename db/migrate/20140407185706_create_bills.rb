class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.integer :manager_id
      t.integer :price
      t.text :description
      t.datetime :deadline
      t.boolean :state

      t.timestamps
    end
  end
end
