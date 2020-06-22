Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:index, :create, :new, :show]
  root to: 'posts#index'

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end
end
