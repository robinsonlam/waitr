Rails.application.routes.draw do
	root to: "users#index"
  resources :users
  resources :items

  get '/login' => 'session#new' # Login Page
  post '/login' => 'session#create' # Starts a new login session
  delete '/login' => 'session#destroy' # Logs out
end
