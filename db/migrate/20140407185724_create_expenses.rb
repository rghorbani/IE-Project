class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :manager_id
      t.integer :price
      t.text :description
      t.datetime :deadline
      t.integer :plan

      t.timestamps
    end
  end
end
