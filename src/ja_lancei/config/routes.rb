Rails.application.routes.draw do
  root to: "welcome#index"

  get "/welcome_po", to: "welcome_po#index"

  get "/welcome_collaborator", to: "welcome_collaborator#index"

  get '/managers', to: 'managers#new'

  get "/welcome", to: "welcome#index"

  resources :managers, only: [:new, :create]
end
