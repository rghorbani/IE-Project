class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :plan_id
      t.integer :unit_id
      t.integer :rate

      t.timestamps
    end
  end
end
