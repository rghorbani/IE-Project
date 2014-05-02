class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.references :user, index: true
      t.string :title
      t.text :content
      t.boolean :system

      t.timestamps
    end
  end
end
