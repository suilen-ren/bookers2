Rails.application.routes.draw do
  devise_for :users
  resources :users ,only: [:index, :show, :edit, :update ,:create]
  resources :books , only: [:new,:create ,:index, :show, :edit, :update ,:destroy]
  post '/users/:id' , to: "books#create"
  root to: 'homes#top'
  get "homes/about" => "homes#about"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
