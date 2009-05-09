ActionController::Routing::Routes.draw do |map|
  map.resources :transactions


  map.resources :slots

  map.resources :loads

  map.resources :accounts

  map.resources :aircrafts

end
