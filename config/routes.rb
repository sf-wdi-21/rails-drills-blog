Rails.application.routes.draw do

  root 'site#index'

  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  get '/users', to: 'users#index'
  post '/users', to: 'users#create'
  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users/:id', to: 'users#show', as: 'user'
  put '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'

end
