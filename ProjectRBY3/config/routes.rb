Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  #root "welcome#index"

  get "/" => "welcome#index"
  get "beranda" => "home#beranda"

  get "posts" => "posts#index"
  #get "posts/index" => "posts#index"
end
