class Expense < ActiveRecord::Base

  belongs_to :building
  has_many :bill
end
