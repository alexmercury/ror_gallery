class UsersSubscription < ActionMailer::Base

  default from: Settings.mailer.user_name

  def user_new_picture_inform(ids)
    @user = User.first
    @pictures = Picture.includes(:category).limit 6
    mail(to: @user.email, subject: "New picture in the category: #{@pictures.count} ...")
  end

end