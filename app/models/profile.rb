class Profile < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :first_name, presence: true, :message => "ورود نام الزامی است."
  validates :last_name, presence: true, :message => "ورود نام خانوادگی الزامی است."

  def name_with_initial
    "#{first_name} #{last_name}"
  end
end
