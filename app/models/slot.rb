class Slot < ActiveRecord::Base

  belongs_to :jumper
  belongs_to :jump_type
  
  def jumper_name
    jumper.name if jumper
  end

end
