class Event < ActiveRecord::Base

  belongs_to :user, :building

end
