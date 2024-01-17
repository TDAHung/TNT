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

  get "explorations", to: "explorations#index"

  namespace :genre do
    get "angels", to: "angels#index"
    get "angels/:id", to: "angels#show"
    get "youth", to: "youth#index"
    get "youth/:id", to: "youth#show"
    get "yan", to: "yan#index"
    get "yan/:id", to: "yan#show"
  end

  namespace :admin do
    resources :posts, only: [:new, :create, :destroy]
    namespace :genre do
      resources :angels, only: [:new, :create, :destroy]
      resources :youth, only: [:new, :create, :destroy]
      resources :yan, only: [:new, :create, :destroy]
    end
  end

  resources :feedbacks, only: [:new, :create]
  resources :posters, only: [:new,:create,:edit, :update]
end
