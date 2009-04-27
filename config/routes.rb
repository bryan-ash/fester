ActionController::Routing::Routes.draw do |map|

  map.resources :slots

  map.resources :loads

  map.resources :jumpers

  map.resources :aircrafts

end
