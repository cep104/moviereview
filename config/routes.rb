Rails.application.routes.draw do
  get '/' => 'sessions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  delete '/logout' => 'sessions#destroy'
  delete '/reviews/:id', to: 'reviews#destroy', as:'review'
  get '/auth/:provider/callback' => 'sessions#create'
  
  resources :movies do 
    resources :reviews, only: [:new, :index]
  end
  resources :directors
  resources :reviews
  resources :genres
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
