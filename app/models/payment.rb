class Payment < ActiveRecord::Base
	belongs_to :bill
	belongs_to :user

	validates :bill_id, presence: true
	validates :user_id, presence: true
	validates :amount, presence: true, numericality: { only_integer: true }
	validates :trace_number, presence: true
	validates :date, presence: true

end
