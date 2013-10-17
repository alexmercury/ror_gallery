class ApplicationController < ActionController::Base

  include SimpleCaptcha::ControllerHelpers

  protect_from_forgery
  after_filter :event_user
  before_filter :set_locale

  private
  # For gem 'devise' (after 'login/logout' path)
  def after_sign_out_path_for(resource_or_scope)
    if resource_class == User
      RailsStream.do_in_stream do
        Event.create(user_id: current_user.id,
                     kind: 'sign_out',
                     kind_id: current_user.id)
      end
      root_path
    else
      root_path
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_class == AdminUser
      admin_dashboard_path
    else
      RailsStream.do_in_stream do
        Event.create(user_id: current_user.id,
                     kind: 'sign_in',
                     kind_id: current_user.id)
      end
      locale_categories_path
    end
  end

  def event_user
    if !!current_user
      if 'index show'.include?(params[:action].to_s)
        RailsStream.do_in_stream do
          NavigationEvent.create(url: request.original_url.to_s,
                                 user_id: current_user.id.to_s,
                                 created_at: DateTime.now)
        end
      end
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end

  def default_url_options
    if I18n.locale == I18n.default_locale
      return {locale: nil}
    else
      return {locale: I18n.locale}
    end
  end

end