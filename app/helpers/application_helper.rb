module ApplicationHelper
	def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def get_profile
  	@profile = current_user.profile || Profile.new
  end

  def get_dir(params)
    #buildings 0
    #expenses 1
    #plans 2
    #index 0
    #show 1
    #edit 2
    case params[:controller]
      when 'buildings'
        d1 = 0
      when 'expenses'
        d1 = 1
      when 'plans'
        d1 = 2
      else
        d1 = 3
    end
    case params[:action]
      when 'index'
        d0 = 0
      when 'show'
        d0 = 1
      when 'edit'
        d0 = 2
      else
        d0 = 3
    end
    return d0+10*d1
  end
end
