class UsersSubscription < ActionMailer::Base

  default from: Settings.mailer.user_name

  def welcome_email(user, picture)
    @user = user
    @picture  = picture
    mail(to: user.email, subject: "New picture in the category: #{@picture.category.title} ...")
  end

  #UsersSubscription.welcome_email(user, picture).deliver

end