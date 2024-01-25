Rails.application.routes.draw do
  get "/users" => "users#index"
  post "/users" => "users#create"
  patch "/users/:id" => "users#update"

  post "/sessions" => "sessions#create"

  get "/grids" => "grids#index"
  post "/grids" => "grids#create"
  get "/grids/:id" => "grids#show"
  patch "/grids/:id" => "grids#update"
  delete "/grids/:id" => "grids#destroy"

  get "/squares" => "squares#index"
  post "/squares" => "squares#create"
  get "/squares/:id" => "squares#show"
  patch "/squares/:id" => "squares#update"
  delete "/squares/:id" => "squares#destroy"
end
