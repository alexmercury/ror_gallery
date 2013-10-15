class UsersSubscription < ActionMailer::Base

  default from: Settings.mailer.user_name

  def user_new_picture_inform(user_id, pictures_ids=[])
    @user = User.includes(:categories).find(user_id)
    @pictures = Picture.where('id IN (:ids) AND category_id IN (:cat_ids)',
                                                  ids: pictures_ids, cat_ids: @user.categories.map{|cat| cat.id})
    mail(to: @user.email, subject: "New picture: #{@pictures.count} ...")
  end

end