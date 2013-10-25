class UsersSubscription < ActionMailer::Base

  default from: Settings.mailer.user_name

  def user_new_picture_inform(user, pictures)
    @user = user
    @pictures = pictures
    mail(to: @user.email, subject: "Admin 'RoR Gallery' has loaded #{@pictures.count} new pictures.")
  end

end