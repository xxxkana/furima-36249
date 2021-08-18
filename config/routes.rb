Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users
  root to: 'items#index'
  resources :items do
   resources :user_item, only: [:index, :create]
   resources :messages, only: [:new, :create]

   collection do
    get 'search'
   end

  end 

end
