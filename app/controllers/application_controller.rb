class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  # For gem 'devise' (after 'login/logout' path)
  def after_sign_out_path_for(resource_or_scope)
    if resource_class == User
    current_user.events.create(kind: 'logout', kind_id: current_user.id, description: 'user logout' )
    root_path
    else
      root_path
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_class == AdminUser
      admin_dashboard_path
    else
      current_user.events.create(kind: 'login', kind_id: current_user.id, description: 'user login' )
      categories_path
    end
  end

end