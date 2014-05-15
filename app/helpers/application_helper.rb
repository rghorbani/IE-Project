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
    @units = Array.new
    @users = Array.new
    @recievers = Array.new
    current_user.buildings.each do |building|
      for unit in building.units
        @units << unit
      end
    end
    for unit in @units
      if(unit.user != nil)
        @users << unit.user
      end
    end
    for user in @users
      if(user.profile != nil)
        @recievers << user.profile
      end
    end
    @recievers = @recievers.uniq
    @recievers
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
