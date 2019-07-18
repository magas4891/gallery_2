Rails.application.routes.draw do
  get 'gallery/index'
  get 'category/index'
  get 'welcome/index'
  devise_for :users

  root 'welcome#index'

  resources :gallery
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
