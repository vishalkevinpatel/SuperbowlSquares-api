Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
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
