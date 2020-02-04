Rails.application.routes.draw do
  resources :users, only: :show
  devise_for :user
  root "books#index"
  resources :books, only: [:index,:show,:new,:create,:edit,:update,:destroy] do 
    resources :reviews
  end

  resources :categories, only: [:index,:show,:new,:create,:edit,:update,:destroy] do 
    member do 
      get :books
    end
  end

end
