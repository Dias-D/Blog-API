Rails.application.routes.draw do
  resources :contacts
  devise_for :users
  namespace :v1 do
    resources :posts
  end
end
