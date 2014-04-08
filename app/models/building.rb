class Building < ActiveRecord::Base

belongs_to :user
has_one :profile
has_many :unit
has_many :event
has_many :news
has_many :plan

end
