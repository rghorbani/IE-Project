class Expense < ActiveRecord::Base
	belongs_to :building
	has_many :bills
end
