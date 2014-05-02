class Unit < ActiveRecord::Base
	belongs_to :building
	belongs_to :user
	has_many :rates
	has_many :bills
	validates_uniqueness_of :unit_number, :scope => :building_id, :message => 'این شماره واحد برای این ساختمان قبلا استفاده شده است'
end
