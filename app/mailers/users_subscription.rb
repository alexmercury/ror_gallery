class UsersSubscription < ActionMailer::Base

  default from: Settings.mailer.user_name

  def user_new_picture_inform(user, picture)
    @user = user
    @picture  = picture
    #@user = current_user
    #@pictures = Picture.includes(:category).where('category_id = :id', id: @categories.last.id)
    mail(to: user.email, subject: "New picture in the category: #{@picture.category.title} ...")
  end

end