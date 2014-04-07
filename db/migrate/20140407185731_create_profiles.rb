class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.text :first_name
      t.text :last_name
      t.boolean :gender
      t.integer :family_size
      t.text :cardnumber

      t.timestamps
    end
  end
end
