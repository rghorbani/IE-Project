class Unit < ActiveRecord::Base

belongs_to :building
belongs_to :user
has_many :bill
has_many :plan

end
