Rails.application.routes.draw do
  get 'categories/index'
  get 'welcome/index'
  devise_for :users

  root 'welcome#index'

  resources :categories

  resources :images do
    resources :comments
    resources :likes
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
