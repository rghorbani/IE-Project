class Plan < ActiveRecord::Base
	has_many :rates
	belongs_to :building

	validates_presence_of :building_id
	validates_presence_of :name, :message => "ورود نام الزامی است."

end
