class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.integer :user_id
      t.text :title
      t.text :content

      t.timestamps
    end
  end
end
