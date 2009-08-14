class Role < ActiveRecord::Base

  def self.default
    find_by_name 'Default'
  end

end
