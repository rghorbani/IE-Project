class Bill < ActiveRecord::Base

  belongs_to :expense
  belongs_to :unit
  has_one :payment
end
