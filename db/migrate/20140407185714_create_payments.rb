class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :building_id
      t.integer :payer_id
      t.integer :trace_id

      t.timestamps
    end
  end
end
