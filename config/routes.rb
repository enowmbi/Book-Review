Rails.application.routes.draw do
  devise_for :user
  root "books#index"
  resources :books, only: [:index,:show,:new,:create,:edit,:update,:destroy]
  resources :categories, only: [:index,:show,:new,:create,:edit,:update,:destroy]

end
