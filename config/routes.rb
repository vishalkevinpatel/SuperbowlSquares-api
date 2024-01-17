Rails.application.routes.draw do
  post "/users" => "users#create"
  get "/users" => "users#index"
  patch "/users/:id" => "users#update"

  post "/sessions" => "sessions#create"
end
