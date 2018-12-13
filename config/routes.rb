Rails.application.routes.draw do

  devise_for :users, path_names: {sign_in:'login',sign_out: 'logout'},  controllers: {
    sessions: 'users/sessions', omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root  'static_pages#home'
  get   '/about',             to: 'static_pages#about'
  get   '/contatti',          to: 'static_pages#contatti'
  
  
 
  resources :users, only: :show

end
