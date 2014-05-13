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

  def get_receivers
    buildings = Unit.select("building_id").where("user_id = ?", current_user.id)
    users = Unit.select("user_id").where("building_id = (?)", buildings)
    @receivers = Profile.where("user_id = (?)", users)
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

def to_jalali_date(datetime)
  @jalali = JalaliDate.to_jalali(datetime)
  @jalali_full_date = "#{@jalali.year}/#{@jalali.month}/#{@jalali.day}"
  @time = datetime.localtime.strftime("%H:%M")
  @str = "#{@jalali_full_date}"
  return @str
end

def to_jalali_full(datetime)
  @jalali = JalaliDate.to_jalali(datetime)
  @jalali_full_date = "#{@jalali.year}/#{@jalali.month}/#{@jalali.day}"
  @time = datetime.localtime.strftime("%H:%M")
  @str = "در تاریخ #{@jalali_full_date} ساعت #{@time} بوقت تهران"
  return @str
end

end
