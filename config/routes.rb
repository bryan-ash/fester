ActionController::Routing::Routes.draw do |map|

  map.resources :accounts

  map.resources :aircrafts

  map.resources :jump_types

  map.resources :loads

  map.resources :payment_methods

  map.resources :slots

  map.resources :transactions

end
