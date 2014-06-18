class Plan < ActiveRecord::Base
	has_many :rates
	belongs_to :building

	validates :building_id, presence: true
	validates :name, presence: true, :message => "ورود نام الزامی است."
	validates :number, presence: true

end
