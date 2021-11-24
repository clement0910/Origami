Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/swiper', to: "questions#index"
  get '/profile', to: 'users#profile'
  resources :users, only: [:show] do
    patch :update_avatar
    patch :update_job
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  get '/auth/spotify/callback', to: 'users#spotify'
end
