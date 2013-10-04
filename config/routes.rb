RorGallery::Application.routes.draw do

  root :to => 'pictures#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/admin/user_events/:user_id/navigation' => 'admin/user_events#navigation', as: :admin_event_user_navigation
  get '/admin/user_events/:user_id/user_sign_in' => 'admin/user_events#event_sign_in', as: :admin_event_user_sign_in
  get '/admin/user_events/:user_id/user_sign_out' => 'admin/user_events#event_sign_out', as: :admin_event_user_sign_out
  get '/admin/user_events/:user_id/like' => 'admin/user_events#event_like', as: :admin_event_like
  get '/admin/user_events/:user_id/subscribe' => 'admin/user_events#event_subscribe', as: :admin_event_subscribe
  get '/admin/user_events/:user_id/comments' => 'admin/user_events#event_comments', as: :admin_event_comments


  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations'}

  get 'pictures' => 'pictures#index', as: :pictures
  get 'categories/:title/:id' => 'pictures#show', as: :picture
  post 'load_comments' => 'pictures#load_comments'

  post 'comment'=> 'comments#create', as: :comment_create

  post 'like' => 'likes#create'
  post 'dislike' => 'likes#destroy'

  post 'subscribe' => 'categories#subscribe'
  post 'unsubscribe' => 'categories#unsubscribe'

  get 'categories'=> 'categories#index', as: :categories
  get 'categories/:title' => 'categories#show', as: :category

  post '/pusher/auth'

  mount Resque::Server, :at => '/resque'

end