Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "homes#index"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :xiao_xiao, only: [:index, :show]
  resources :xiao_han, only: [:index, :show]

  namespace :admin do
    resources :xiao_xiao, only: [:new, :create, :destroy]
    resources :xiao_han, only: [:new, :create, :destroy]
  end
  resources :popcorns, only: [:create, :destroy]
end
