Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/swiper', to: "questions#index"
  get '/profile', to: 'users#profile'
  post '/swiper-answer', to: "answers#create_from_swiper"

  resources :users, only: [:show, :update, :edit]

  resources :chatrooms, only: [:show, :index] do
    resources :messages, only: :create
  end

  get '/auth/spotify/callback', to: 'users#spotify'
end
