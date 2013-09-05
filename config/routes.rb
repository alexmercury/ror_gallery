Tit::Application.routes.draw do

  devise_for :users

  root :to => 'pictures#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'categories/:title/:id' => 'pictures#show', as: :picture

  get 'categories'=> 'categories#index'
  get 'categories/:title' => 'categories#show', as: :category

end