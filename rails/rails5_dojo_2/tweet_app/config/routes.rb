Rails.application.routes.draw do
  get "posts/new" => "posts#new"
  get "posts/index" => "posts#index"
  

  post "posts/:id/destroy" => "posts#destroy"
  post "posts/create" => "posts#create"
  post "posts/:id/update" => "posts#update"

   
  get "posts/:id/edit" => "posts#edit"
  get "posts/:id" => "posts#show"



  get "/" => "home#top"
  get "about" => "home#about"
end
