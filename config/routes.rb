Rails.application.routes.draw do
  devise_for :users
  resources :posts, except: :show
  root to: 'posts#index'
  get '/my_posts', to: 'posts#my_posts'


  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end
end
