Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  post '/swiper-answer', to: "answers#create_from_swiper"
  get '/swiper', to: "questions#index"
  get '/users/:id/in-group', to: "users#in_group?"

  get '/profile', to: 'users#profile'
  resources :users, only: [:show, :update, :edit]

  resources :chatrooms, only: [:show, :index] do
    resources :messages, only: :create
  end

  get '/auth/spotify/callback', to: 'users#spotify'
end
