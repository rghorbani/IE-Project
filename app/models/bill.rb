class Bill < ActiveRecord::Base
	belongs_to :unit
	belongs_to :expense
	has_many :payments

	validates :price, presence: true, numericality: { only_integer: true }, :message => "ورود قیمت الزامی است."
	validates :deadline, presence: true, :message => "ورود تاریخ پایان الزامی است."
end
