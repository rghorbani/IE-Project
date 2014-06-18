class Profile < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user_id
  validates_presence_of :first_name, :message => "ورود نام الزامی است."
  validates_presence_of :last_name, :message => "ورود نام خانوادگی الزامی است."

  def name_with_initial
    "#{first_name} #{last_name}"
  end
end
