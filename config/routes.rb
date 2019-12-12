Rails.application.routes.draw do
  devise_for :users
   root "books#index"
   resources :books, only: [:index,:show,:new,:create,:edit,:update,:destroy]
   resources :categories, only: [:index,:show,:new,:create,:edit,:update,:destroy]

end
