class AddReferencesToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :user_id, :integer
    remove_column :buildings, :manager_id
  end
end
