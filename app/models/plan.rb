class Plan < ActiveRecord::Base
	has_many :rates
	belongs_to :building
end
