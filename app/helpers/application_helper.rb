module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def title(page_title)
    content_for(:title) { page_title.to_s }
  end

  def default_locale?
    if params[:locale].to_s == I18n.default_locale.to_s || params[:locale].blank?
       return true
    end
    false
  end

end