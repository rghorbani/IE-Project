class Expense < ActiveRecord::Base
	belongs_to :building
	has_many :bills

	validates :price, presence: true, numericality: { only_integer: true, :message => "ورود قیمت الزامی است."}
	validates_presence_of :release_date, :message => "ورود تاریخ صدور قبض الزامی است."
	validates_presence_of :deadline, :message => "ورود تاریخ پایان الزامی است."
end
