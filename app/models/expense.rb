class Expense < ActiveRecord::Base
	belongs_to :building
	has_many :bills

	validates :price, presence: true
end
