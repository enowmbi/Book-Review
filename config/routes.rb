Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/edit'
  get 'reviews/update'
  get 'reviews/index'
  devise_for :user
  root "books#index"
  resources :books, only: [:index,:show,:new,:create,:edit,:update,:destroy] do 
     resources :reviews
  end

  resources :categories, only: [:index,:show,:new,:create,:edit,:update,:destroy]

end
