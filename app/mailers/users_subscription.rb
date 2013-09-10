class UsersSubscription < ActionMailer::Base
  default from: Settings.mailer.user_name

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: user.email, subject: 'Welcome to My Awesome Site')
  end

  #UsersSubscription.welcome_email(current_user).deliver


end