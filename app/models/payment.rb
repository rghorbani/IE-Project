class Payment < ActiveRecord::Base

  belongs_to :bill
  belongs_to :user
end
