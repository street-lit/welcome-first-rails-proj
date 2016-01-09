Rails.application.routes.draw do
  get '/users/create', to: 'users#create'
  get('/users', { to: 'users#index' })
  get('/users/:id', { to: 'users#show' })
  get('/users/:id/delete', { to: 'users#destroy' })
end
