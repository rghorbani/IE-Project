class Building < ActiveRecord::Base
	belongs_to :user
	has_many :units
	has_many :expenses
	has_many :plans
	has_many :messages
	has_many :news
	validates_presence_of :units_cnt, :message => "ورود تعداد واحد ساختمان الزامی است."

	def name_of_building
		"#{name}"
    end
end
