Rails.application.routes.draw do

  resources :apartments do
   resources :reviews, only: :create
   resources :bookings
  end
  resources :profiles

  devise_for :users
  root to: 'apartments#index'
  get 'profile', to: 'profiles#my_profile', as: 'show_profile'
  get 'my_listings', to: 'apartments#my_listings', as: 'show_listings'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
