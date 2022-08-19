Rails.application.routes.draw do
  resources :contests
  resources :users
  #get 'home/index'
  get "/about" =>"home#about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "home#index"
end
