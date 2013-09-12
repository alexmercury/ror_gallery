class CategorySubscriptionMailer

  @queue = :category_subscription_queue

  def self.perform(picture_id)
    picture = Picture.find(picture_id)

    category = Category.includes(:users).find(picture.category_id)

    unless category.users.blank?
      category.users.each do |user|
        UsersSubscription.welcome_email(user, picture).deliver
      end
    end

  end

end