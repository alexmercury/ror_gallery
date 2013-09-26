module PusherRails

  extend self

  def self.initialize(pusher)
    @pusher = pusher
  end

  def trigger
    @pusher['test_channel'].trigger('my_event', {
        message: 'hello world'
    })
  end

  def comment_add(data = {})
    @pusher['comments_channel'].trigger('comment_event', data)
  end

end