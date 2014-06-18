class Rate < ActiveRecord::Base
	belongs_to :plan
	belongs_to :unit

	validates :plan_id, presence: true
	validates :unit_id, presence: true
	validates :rate, presence: true
end
