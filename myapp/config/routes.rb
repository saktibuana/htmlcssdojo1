Rails.application.routes.draw do
  get 'history/add'
  get 'user/signup'
  get "/" => "home#index"
  get "/signup" => "user#signup"
  get "/login" => "user#login"
  post "/user/add" => "user#add"
  post "/login" => "user#action_login"
  get "/logout" => "user#logout"

  get "/history/add" => "history#add"
  get "/history/:id/detail" => "history#detail"
  get "history/:id/edit" => "history#edit"
  post "/history/action_add" => "history#action_add"
  post "/history/:id/action_edit" => "history#action_edit"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
