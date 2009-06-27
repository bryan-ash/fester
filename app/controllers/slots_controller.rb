class SlotsController < ApplicationController

  autocomplete_for :account, :name, :order => 'name ASC'
  
end
