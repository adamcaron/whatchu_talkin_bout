Rails.application.routes.draw do
  root                               'landing#show'
  get  '/auth/twitter/callback', to: 'sessions#create'
  get  '/feed',                  to: 'feed#show'
  get  '/logout',                to: 'sessions#destroy'


  # get '/welcome', to: 'home#welcome'
  # get '/search_results', to: 'home#search_results'
  # get '/discussion', to: 'home#discussion'
end
