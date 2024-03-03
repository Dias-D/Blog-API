Rails.application.routes.draw do
  namespace :v1 do
    devise_for :users
    resources :posts

    get '/posts/user/:user_id', to: 'posts#byUser'
    get '/users/:id', to: 'users#show'
    put '/users/:id', to: 'users#update'
  end
end
