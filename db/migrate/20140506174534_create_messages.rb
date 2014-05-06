class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.text :content
      t.boolean :seen, :default => false
      t.integer :parent_id, :default => 0

      t.timestamps
    end
  end
end
