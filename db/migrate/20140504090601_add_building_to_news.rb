class AddBuildingToNews < ActiveRecord::Migration
  def change
  	add_column :news, :building_id, :integer
  end
end
