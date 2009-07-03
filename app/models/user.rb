class User < ActiveRecord::Base

  acts_as_authentic

  def permitted_to_see?(name)
    username == 'Mani Fester'
  end

end
