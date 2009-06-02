ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'welcome'

  map.login  'login',  :controller => 'user_sessions', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  
  map.resources :accounts

  map.resources :aircrafts

  map.resources :equipment

  map.resources :jump_types

  map.resources :loads

  map.resources :payment_methods

  map.resources :slots

  map.resources :transactions

  map.resources :users
  
  map.resources :user_sessions

end
