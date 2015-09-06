Rails.application.routes.draw do
  root to: "pages#home"
  get '/users/edit' => 'users#edit', :as => :edit_user
  resources :users, :except => [:edit]
  resources :items

  get '/login' => 'session#new', :as => 'login' # Login Page
  post '/login' => 'session#create' # Starts a new login session
  delete '/login' => 'session#destroy', :as => 'logout' # Logs out

  get '/' => 'pages#home'
end
