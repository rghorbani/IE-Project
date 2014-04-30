class RemoveGeneralInfoFromBuilding < ActiveRecord::Migration
  def change
  	remove_column :buildings, :general_info
  end
end
