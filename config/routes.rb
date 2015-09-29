Rails.application.routes.draw do

  root 'site#index'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    resources :articles, only: [:new, :create]
  end
  resources :articles, only: [:index, :show, :edit, :update, :destroy]

end
































