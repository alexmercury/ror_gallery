Warden::Manager.after_set_user do |user|
  if user.is_a?(User)
    ActiveSupport::Notifications.instrument('current_user', user_id: user.id)
  end
end
