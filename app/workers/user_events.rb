class UserEvents

  @queue = :user_events_queue

  def self.perform(params)

    if params.has_key? 'url'

      NavigationEvent.create(user_id: params['user_id'], url: params['url'])

    else
      #Event.create params
    end






  end

end