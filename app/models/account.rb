class Account < ActiveRecord::Base

  def self.pilots
    find_all_by_pilot(true)
  end

end
