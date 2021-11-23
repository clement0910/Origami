Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/profile', to: 'users#profile'
  resources :users, only: [:show] do
    patch :update_avatar
    patch :update_job
  end

  get '/messages', to: 'room#index'

  get '/auth/spotify/callback', to: 'users#spotify'

end
