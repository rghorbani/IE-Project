class Plan < ActiveRecord::Base

  belongs_to :building
  belongs_to :unit
end
