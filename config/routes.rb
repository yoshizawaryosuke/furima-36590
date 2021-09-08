Rails.application.routes.draw do
  root to: 'items#index'
  resources :items do
    resources :buys, only: [:index, :create]
  end
  
  devise_for :users
end