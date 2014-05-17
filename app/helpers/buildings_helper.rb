module BuildingsHelper


	def get_buildings
		@buildings = current_user.buildings
	end
end
