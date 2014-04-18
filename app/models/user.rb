class User < ActiveRecord::Base

  has_one :profile
  has_many :buildings
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Include roles at the end
  ROLES = %w[admin control manager resident]
  
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def has_role?(role)
    roles.include?(role.to_s)
  end

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  def add_role(role)
    if not roles.include?(role.to_s)
      if ROLES.index(role.to_s)
        self.roles += [role.to_s]
      else
        return false
      end
    else
      return self.roles
    end
  end
end
