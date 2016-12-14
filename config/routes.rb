Rails.application.routes.draw do
  scope :api do
    resources :reviews
    resources :users, except: [:create]
    resources :mubees
    resources :skills
    resources :contracts, only: [:index, :show]
    resources :charges


    get 'dashboard', to: 'dashboard#index'
    post 'register', to: 'auth#register'
    post 'login', to: 'auth#login'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
