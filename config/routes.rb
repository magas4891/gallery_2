require 'resque/server'
Rails.application.routes.draw do
  mount Resque::Server.new, at: "/resque"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'categories/index'
  get 'welcome/index'
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks',
                                                sessions: 'users/sessions' }

  root 'welcome#index'

  resources :categories do
    resources :follows
  end

  resources :images do
    resources :comments
    resources :likes
  end

  require 'resque/scheduler'
  require 'resque/scheduler/server'





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
