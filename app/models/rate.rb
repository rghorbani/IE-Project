class Rate < ActiveRecord::Base
	belongs_to :plan
	belongs_to :unit

	validates_presence_of :plan_id
	validates_presence_of :unit_id
	validates_presence_of :rate
end
