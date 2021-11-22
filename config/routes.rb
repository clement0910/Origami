Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/user', to: 'users#show'
  get '/swiper', to: 'questions#index'
  get '/messages', to: 'room#index'

  get '/auth/spotify/callback', to: 'users#spotify'

end
