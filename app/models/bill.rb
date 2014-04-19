class Bill < ActiveRecord::Base
	belongs_to :unit
	belongs_to :expense
	has_many :payments
end
