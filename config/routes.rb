Rails.application.routes.draw do

  devise_for :users, path_names: { sign_in:'login', sign_out: 'logout' },  controllers: {
    sessions: 'users/sessions', omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations' 
  }

  root  'static_pages#home'
  get   '/about',                   to: 'static_pages#about'
  get   '/contatti',                to: 'static_pages#contatti'
  get   '/users',                   to: 'users#index'
  get   '/users/miei-annunci',      to: 'announcements#index'
  
  resources :users, only: [:show]
  resources :announcements
  
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

end
