class UserEvents

  @queue = :user_events_queue

  def self.perform(params)
      Event.create params
  end

end