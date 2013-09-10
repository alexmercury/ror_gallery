Tit::Application.routes.draw do

  root :to => 'pictures#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  get 'pictures' => 'pictures#index', as: :pictures
  get 'categories/:title/:id' => 'pictures#show', as: :picture

  post 'comment'=> 'comments#create', as: :comment_create

  post 'like' => 'likes#create'
  post 'dislike' => 'likes#destroy'

  post 'subscribe' => 'categories#subscribe'
  post 'unsubscribe' => 'categories#unsubscribe'

  get 'categories'=> 'categories#index', as: :categories
  get 'categories/:title' => 'categories#show', as: :category

end