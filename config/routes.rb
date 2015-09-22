Rails.application.routes.draw do
  root 'home#landing'

  get '/auth/twitter/callback', to: 'sessions#create'

  get '/welcome', to: 'home#welcome'
  get '/search_results', to: 'home#search_results'
  get '/discussion', to: 'home#discussion'
end
