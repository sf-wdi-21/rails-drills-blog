Rails.application.routes.draw do

  root 'site#index'

  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  resources :users do
    #collection actions
    resources :articles, only: [:new, :create]
  end
  #member actions
  resources :articles, only: [:index, :show, :edit, :update, :destroy]

  # get '/users', to: 'users#index'
  # post '/users', to: 'users#create'
  # get '/users/new', to: 'users#new', as: 'new_user'
  # get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  # get '/users/:id', to: 'users#show', as: 'user'
  # patch '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'

  # get '/articles', to: 'articles#index'

  # post '/users/:user_id/articles', to: 'articles#create', as: 'user_articles'
  # get '/users/:user_id/articles/new', to: 'articles#new', as: 'new_user_article'
  # get '/users/:user_id/articles/:id/edit', to: 'articles#edit', as: 'edit_user_article'
  # get '/users/:user_id/articles/:id', to: 'articles#show', as: 'user_article'
  # put '/users/:user_id/articles/:id', to: 'articles#update'
  # delete '/users/:user_id/articles/:id', to: 'articles#destroy'

end
































