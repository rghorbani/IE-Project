class Building < ActiveRecord::Base
	belongs_to :user
	has_many :units
	has_many :expenses
	has_many :plans
	has_many :messages
	has_many :news
	validates_presence_of :floor_cnt, numericality: { only_integer: true }, :message => "ورود تعداد تبقات ساختمان الزامی است."
	validates_presence_of :units_cnt, numericality: { only_integer: true }, :message => "ورود تعداد واحد ساختمان الزامی است."

	def name_of_building
		"#{name}"
    end
end
