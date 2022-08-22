Rails.application.routes.draw do
  get "users" => "users#index"
  get "users/signup" => "users#signup"
  get "users/credential" => "users#credential"
  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  post "users/:id/update" => "users#update"
  post "users/:id/destroy" => "users#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  resources :articles do
    resources :comments
  end
end
