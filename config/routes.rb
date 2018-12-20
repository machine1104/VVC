Rails.application.routes.draw do

  devise_for :users, path_names: { sign_in:'login', sign_out: 'logout' },  controllers: {
    sessions: 'users/sessions', omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations' 
  }

  root  'static_pages#home'
  get   '/about',                   to: 'static_pages#about'
  get   '/contatti',                to: 'static_pages#contatti'
  get   '/users',                   to: 'users#index'
    
  resources :users, only: [:show] do
    resources :announcements, except: [:index]
    get   '/miei-annunci', to: 'announcements#index'
  end
  
  resources :announcements, only: [:index, :show]
  
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

end
