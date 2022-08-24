Rails.application.routes.draw do
  get '/login' => 'user#login'
  post '/login' => 'user#login_form'

  get '/logout' => 'user#logout'
  post '/logout' => 'user#logout'

  get '/signup' => 'user#signup'
  get '/user/:id' => 'user#show'
  post '/signup/create' => 'user#create'

  get '/article' => 'article#index'
  get '/article/:id' => 'article#read'

  get '/' => 'home#index'
  get '/contestant' => 'home#contestant'
  post '/home/create' => 'home#create'
end
