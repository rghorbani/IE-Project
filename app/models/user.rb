class User < ActiveRecord::Base
	has_one :profile
	has_many :buildings
	has_many :units
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
