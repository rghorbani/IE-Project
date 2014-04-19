class Unit < ActiveRecord::Base
	belongs_to :building
	belongs_to :user
	has_many :rates
	has_many :bills
end
