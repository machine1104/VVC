Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root  'static_pages#home'
  get   '/about',             to: 'static_pages#about'
  get   '/contatti',          to: 'static_pages#contatti'

  resources :users
end
