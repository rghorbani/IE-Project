class FixProfile < ActiveRecord::Migration
  def change
  	remove_column :profiles, :first_name
  	remove_column :profiles, :last_name
  	remove_column :profiles, :gender
  	remove_column :profiles, :cardnumber
  	add_column :profiles, :first_name, :string
  	add_column :profiles, :last_name, :string
  	add_column :profiles, :gender, :integer
  	add_column :profiles, :cardnumber, :string
  end
end
