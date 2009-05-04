class Slot < ActiveRecord::Base

  belongs_to :jumper
  belongs_to :jump_type
  
  def jumper_name
    jumper.name if jumper
  end

  def jump_type_name
    jump_type.name if jump_type
  end

end
