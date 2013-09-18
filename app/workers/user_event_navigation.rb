class UserEventNavigation

  @queue = :user_event_navigation_queue

  def self.perform(params)

    navigation_count = Resque.redis.llen 'navigation'

    if navigation_count.to_i >= 10

      navigation = Array.new()

      Array.new(Resque.redis.lrange('navigation', 0,9)).each do |nav|
        navigation << NavigationEvent.new(JSON.parse(nav))
      end

      NavigationEvent.transaction do
        navigation.each(&:save!)
      end

      Resque.redis.del('navigation')
      Resque.redis.rpush('navigation', params.to_json)

    else

      Resque.redis.rpush('navigation', params.to_json)

    end

    #For DEBUG
    #resque_log = "**Log for resque\n"
    #system("touch #{Rails.root.join('log/resque.log')}")
    #system("echo '#{resque_log}' > #{Rails.root.join('log/resque.log')}")

  end

end