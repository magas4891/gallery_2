Rails.application.routes.draw do
  get 'categories/index'
  get 'welcome/index'
  devise_for :users

  root 'welcome#index'

  resources :categories

  resources :categories do
    resources :images do
      resources :comments
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
