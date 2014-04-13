<<<<<<< HEAD
require 'role_model'

class User < ActiveRecord::Base

  has_one :profile
  has_many :news
  has_many :building
=======
class User < ActiveRecord::Base
>>>>>>> c65f81f4d82ef87298bbcbc553797664478b880b
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
<<<<<<< HEAD

  include RoleModel

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :roles, :roles_mask
 
  # optionally set the integer attribute to store the roles in,
  # :roles_mask is the default
  roles_attribute :roles_mask
 
  # declare the valid roles -- do not change the order if you add more
  # roles later, always append them at the end!
  roles :admin, :manager, :member, :guest
=======
>>>>>>> c65f81f4d82ef87298bbcbc553797664478b880b
end
