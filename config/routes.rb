Rails.application.routes.draw do

  #not sure what I plan on doing with this route yet
  get 'genres/index'
  

  #allows me to use chained URLs
  resources :users, only: [:new, :create, :edit, :update] do
    resources :posts
    get 'genres/search_result', to: 'genres#search_result'
  end
  resources :posts, only: [:index]
  
  resources :genres do
    resources :posts
  end

  #fixed rails auto direct issue you have to manual redirect
  get 'users/:user_id', to: 'users#edit'

  #custom login/logout routes
  get '/signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#logout'

  root 'sessions#new'

  #used for omni auth
  get '/auth/:provider/callback', to: 'sessions#create'

end
