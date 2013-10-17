class UsersSubscription < ActionMailer::Base

  default from: ENV['MAILER_USER_NAME']

  def user_new_picture_inform(user, pictures)
    @user = user
    @pictures = pictures
    mail(to: @user.email, subject: "Admin 'RoR Gallery' has loaded #{@pictures.count} new pictures.")
  end

end