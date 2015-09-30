Rails.application.routes.draw do
  root                              'landing#show'
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/feed',                  to: 'feed#show'
  get '/feed/create',           to: 'feed#create'
  get '/logout',                to: 'sessions#destroy'
end
