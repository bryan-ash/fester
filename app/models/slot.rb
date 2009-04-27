class Slot < ActiveRecord::Base

  belongs_to :jumper
  
  def jumper_name
    jumper.name if jumper
  end

end
