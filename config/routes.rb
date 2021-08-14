Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users
  root to: 'items#index'
  resources :items do
   resources :user_item, only: [:index, :create]
  end 
  resources :messages, only: [:new, :create]
end
