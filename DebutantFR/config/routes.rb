Rails.application.routes.draw do
  get 'lesson/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "welcome#index"

  get "/" => "welcome#index"
  get "beranda" => "home#beranda"

  post "login" => "users#login" 
  get "logout" => "users#logout"

  get "signup" => "signup#index"
  post "signup/create" => "signup#create"

  get "posts/" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"

  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  get "posts/:id/destroy" => "posts#destroy"
  post "posts/:id/destroy" => "posts#destroy"
  
  get "users" => "users#index"
  post "users/create" => "users#create"
  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  

  get "lesson" => "lesson#index"

end
