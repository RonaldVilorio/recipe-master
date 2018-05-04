Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static#index"
  resources :recipes
  resources :ingredients, only: [:index]
  resources :users do
    resources :recipes, only: [:index, :show, :new, :edit, :destroy]
  end
  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/auth/facebook/callback', to: 'sessions#omnicreate'

end
