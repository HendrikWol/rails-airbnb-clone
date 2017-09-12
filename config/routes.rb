Rails.application.routes.draw do

  resources :apartments do
   resources :reviews, only: :create
  end
  resources :profiles

  devise_for :users
  root to: 'apartments#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
