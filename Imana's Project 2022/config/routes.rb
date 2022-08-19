Rails.application.routes.draw do
# untuk di rails 7 likes menggungakan "get", jika rails 5 menggunakan "post"
 # linkto...(all) (dipost-show.html)...jika di rails 7 method="post"nya di hapus
  get "likes/:post_id/create" => "likes#create"
  get "likes/:post_id/destroy" => "likes#destroy"

  
  get "login" => "users#login_form"
  post "login" => "users#login"
  get "logout" => "users#logout"

  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"

  get "users/:id/likes" => "users#likes"

  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  
  get "/" => "home#top"
  get "about" => "home#about"
end
