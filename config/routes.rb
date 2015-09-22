Rails.application.routes.draw do
  root 'home#landing'
  get '/welcome', to: 'home#welcome'
end
