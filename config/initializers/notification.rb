ActiveSupport::Notifications.subscribe 'current_user' do |name, start, finish, id, payload|
  @user_id = payload[:user_id]
end

ActiveSupport::Notifications.subscribe 'process_action.action_controller' do |name, start, finish, id, payload|
  if @user_id
    if 'index show home'.include?(payload[:action].to_s)
      Resque.enqueue(UserEventNavigation,
                     {url: payload[:path].to_s,
                      user_id: @user_id.to_s,
                      created_at: DateTime.now
                     })
    end
  end
end