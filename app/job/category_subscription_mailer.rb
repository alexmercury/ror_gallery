class CategorySubscriptionMailer

  @queue = :category_subscription_queue

  def self.perform()

    new_pictures_count = Resque.redis.llen 'new_pictures'

    if new_pictures_count > 0
      ids = Array.new(Resque.redis.lrange('new_pictures', 0, new_pictures_count.to_i)).map{|val| val.to_i}
      categories = Category.includes(:pictures, :users).where('pictures.id IN (:ids)', ids: ids)

      tmp = Array.new
      categories.map{|category| category.users.map{|user| user.id}}.each do |cat|
        tmp += cat
      end

      tmp.uniq.each do |id|
        UsersSubscription.user_new_picture_inform(id, ids)
      end
      Resque.redis.del('new_pictures')
    end

  end

end