Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'

  get 'amenities/index'

  get 'amenities/show'

  get 'amenities/new'

  get 'amenities/create'

  get 'amenities/edit'

  get 'amenities/update'

  get 'amenities/destroy'

  get 'reviews/index'

  get 'reviews/show'

  get 'reviews/new'

  get 'reviews/create'

  get 'reviews/edit'

  get 'reviews/update'

  get 'reviews/destroy'

  get 'profiles/index'

  get 'profiles/show'

  get 'profiles/new'

  get 'profiles/create'

  get 'profiles/edit'

  get 'profiles/update'

  get 'profiles/destroy'

  get 'apartments/index'

  get 'apartments/show'

  get 'apartments/new'

  get 'apartments/create'

  get 'apartments/edit'

  get 'apartments/update'

  get 'apartments/destroy'

  get 'bookings/index'

  get 'bookings/show'

  get 'bookings/new'

  get 'bookings/create'

  get 'bookings/edit'

  get 'bookings/update'

  get 'bookings/destroy'

  devise_for :users
  root to: 'apartments#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
