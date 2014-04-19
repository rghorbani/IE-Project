class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.integer :expense_id
      t.integer :unit_id
      t.integer :price
      t.datetime :deadline
      t.text :description
      t.boolean :status

      t.timestamps
    end
  end
end
