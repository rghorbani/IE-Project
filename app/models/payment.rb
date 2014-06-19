class Payment < ActiveRecord::Base
	belongs_to :bill
	belongs_to :user

	validates_presence_of :bill_id
	validates_presence_of :user_id
	validates :amount, presence: {:message => 'وارد کردن قیمت الزامی می باشد'}, numericality: { only_integer: true }
	validates_presence_of :trace_number
	validates_presence_of :date

end
