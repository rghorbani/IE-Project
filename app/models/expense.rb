class Expense < ActiveRecord::Base
	belongs_to :building
	has_many :bills

	validates :price, presence: true, numericality: { only_integer: true }, :message => "ورود قیمت الزامی است."
	validates :release_date, presence: true, :message => "ورود تاریخ صدور قبض الزامی است."
	validates :deadline, presence: true, :message => "ورود تاریخ پایان الزامی است."
end
