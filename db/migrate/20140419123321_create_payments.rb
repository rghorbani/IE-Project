class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :bill_id
      t.integer :user_id
      t.integer :amount
      t.integer :trace_number
      t.boolean :status
      t.text :message
      t.datetime :date

      t.timestamps
    end
  end
end
