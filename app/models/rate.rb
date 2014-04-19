class Rate < ActiveRecord::Base
	belongs_to :plan
	belongs_to :unit
end
