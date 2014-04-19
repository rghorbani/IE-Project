class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :building_id
      t.integer :price
      t.text :description
      t.datetime :release_date
      t.datetime :deadline
      t.integer :number

      t.timestamps
    end
  end
end
