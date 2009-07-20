class JumpType < ActiveRecord::Base

  def self.all_by_name
    self.all :order => 'name ASC'
  end

end
