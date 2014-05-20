class Profile < ActiveRecord::Base
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true

  def name_with_initial
    "#{first_name} #{last_name}"
  end
end
