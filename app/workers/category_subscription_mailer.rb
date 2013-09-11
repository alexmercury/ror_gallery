class CategorySubscriptionMailer

  @queue = :category_subscription_queue

  def self.perform(picture_id)
    picture = Picture.find(picture_id)

    users = User.where('users.id IN (SELECT category_subscriptions.user_id FROM category_subscriptions WHERE category_id = :id)', id: picture.category_id)

    users.each do |user|
      UsersSubscription.welcome_email(user, picture).deliver
    end

  end

end