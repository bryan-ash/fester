class Aircraft < ActiveRecord::Base

  def self.find_ours
    find_all_by_ours(true)
  end

end
