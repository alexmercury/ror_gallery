ActiveAdmin.register_page 'User Events' do

  page_action :index, method: :get do
    @users = User.order('created_at desc').page(params[:page]).per 10
  end

  page_action :navigation, method: :get do
    @navigation = NavigationEvent.includes(:user).where('user_id = :id', id: params[:user_id]).order('created_at DESC').page(params[:page]).per 30
    render 'admin/event/user_navigation'
  end

  page_action :event_sign_in, method: :get do
    @event = Event.includes(:user).where('user_id = :id AND kind = :kind', id: params[:user_id], kind: 'sign_in').order('created_at DESC').page(params[:page]).per 30
    render 'admin/event/event_show'
  end

  page_action :event_sign_out, method: :get do
    @event = Event.includes(:user).where('user_id = :id AND kind = :kind', id: params[:user_id], kind: 'sign_out').order('created_at DESC').page(params[:page]).per 30
    render 'admin/event/event_show'
  end

  page_action :event_like, method: :get do
    @event = Event.includes(:user).where('user_id = :id AND kind like :kind', id: params[:user_id], kind: '%like').order('created_at DESC').page(params[:page]).per 30
    render 'admin/event/event_show'
  end

  page_action :event_subscribe, method: :get do
    @event = Event.includes(:user).where('user_id = :id AND kind like :kind', id: params[:user_id], kind: '%subscribe').order('created_at DESC').page(params[:page]).per 30
    render 'admin/event/event_show'
  end

  page_action :event_comments, method: :get do
    @event = Event.includes(:user).where('user_id = :id AND kind = :kind', id: params[:user_id], kind: 'comment').order('created_at DESC').page(params[:page]).per 30
    render 'admin/event/event_show'
  end

  sidebar 'User' do
  end

  content title:'User Events' do
    render partial: 'admin/event/user_events'
  end

end