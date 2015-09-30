Rails.application.routes.draw do
  root                              'landing#show'
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/feed',                  to: 'feed#show'
  get '/logout',                to: 'sessions#destroy'
  get '/combined_feed',         to: 'feed#combined_feed'
  get '/individual_feed',       to: 'feed#individual_feed'
end
