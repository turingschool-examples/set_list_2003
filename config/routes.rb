Rails.application.routes.draw do
  get '/songs', to: 'songs#index'
  get '/songs/:id', to: 'songs#show'
end
