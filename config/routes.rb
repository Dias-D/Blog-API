Rails.application.routes.draw do
  namespace :v1 do
    devise_for :users
    resources :posts
    resources :users

    get '/posts/user/:user_id', to: 'posts#byUser'
  end
end
