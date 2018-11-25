Rails.application.routes.draw do
  
  get 'sessions/new'

  root  'static_pages#home'
  get   '/about',             to: 'static_pages#about'
  get   '/contatti',          to: 'static_pages#contatti'
  get   '/registrazione',     to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  
end
