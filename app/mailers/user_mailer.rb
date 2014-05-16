class UserMailer < ActionMailer::Base
  default from: "no-reply@4khuneh.ir"

  def welcome_email(user)
    @user = user
    @url  = 'http://4khuneh.ir/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to 4Khuneh')
  end
  handle_asynchronously :welcome_email

  def update_profile(user, profile)
    @user = user
    @profile = profile
    mail(to: @user.email, subject: '4Khuneh profile updated')
  end

  def new_unit(user,unit)
    @user = user
    @unit = unit
    mail(to: @user.email, subject: 'به چهارخونه خوش آمدید!')
  end

  handle_asynchronously :update_profile

end
