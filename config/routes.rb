Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/about", to: "about#index"

  get "/change_password", to: "password#edit"
  patch "/change_password", to: "password#update"

  get "/signup", to: "registrations#new"
  post "/signup", to: "registrations#create"

  get "/login", to: "sessions#login"
  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  root to: "main#index"
end
