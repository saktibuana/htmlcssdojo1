Rails.application.routes.draw do
  get "/" => "home#top"
  get "/about" =>"home#about"
  resources :winners
  resources :prizes
  resources :contestants
  resources :users
  resources :contests
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "home#top"
end
