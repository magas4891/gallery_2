Rails.application.routes.draw do
  get 'category/index'
  get 'welcome/index'
  devise_for :users

  root 'welcome#index'

  resources :category
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
