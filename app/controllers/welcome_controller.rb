class WelcomeController < ApplicationController

  skip_before_filter :authorize_access
  
  def index
  end

end
