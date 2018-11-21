Rails.application.routes.draw do
  
  root  'static_pages#home'
  get   '/about',             to: 'static_pages#about'
  get   '/contatti',          to: 'static_pages#contatti'
  get   '/registrazione',     to: 'users#new'
  
  resources :users
  
end
