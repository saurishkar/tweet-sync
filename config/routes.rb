Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/about", to: "about#index"

  get "/change_password", to: "password#edit"
  patch "/change_password", to: "password#update"

  get "/forgot_password", to: "guest#password_reset"
  post "/forgot_password", to: "guest#send_password_reset_email"

  get "/password_reset", to: "guest#password_reset_edit"
  post "/password_reset", to: "guest#password_reset_update"

  get "/signup", to: "registrations#new"
  post "/signup", to: "registrations#create"

  get "/login", to: "sessions#login"
  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  get "/auth/twitter/callback", to: "omniauth_callbacks#twitter"

  resources :twitter_accounts
  resources :tweets

  root to: "main#index"
end
