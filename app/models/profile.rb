class Profile < ActiveRecord::Base
  belongs_to :user

  def name_with_initial
    "#{first_name} #{last_name}"
  end
end
