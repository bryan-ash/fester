ActionController::Routing::Routes.draw do |map|

  map.root :controller => 'user_sessions', :action => 'new'
  
  map.login  'login',  :controller => 'user_sessions', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  
  map.entry_page 'entry_page', :controller => 'loads', :action => 'index'

  map.resources :accounts
  map.resources :aircrafts
  map.resources :csv_imports, :only => [:new, :create]
  map.resources :equipment, :singular => :equipment_instance
  map.resources :jump_types
  map.resources :loads
  map.resources :payment_methods
  map.resources :slots, :collection => { :autocomplete_for_account_name => :get}
  map.resources :transactions
  map.resources :users
  map.resources :user_sessions

end
