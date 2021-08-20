Rails.application.routes.draw do
  get "/posts" => "posts#index"
  get "/posts/:id" => "posts#show"
  post "/posts" => "posts#create"
  delete "/posts/:id" => "posts#destroy"

  post "/comments" => "comments#create"

  post "/users" => "users#create"
  get "/users/:id" => "users#show"

  post "/sessions" => "sessions#create"

  get "/likes" => "likes#index"
  post "/likes" => "likes#create"
  delete "/likes" => "likes#destroy"
end
