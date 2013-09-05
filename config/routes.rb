Tit::Application.routes.draw do

  devise_for :users

  root :to => 'pictures#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :pictures



end