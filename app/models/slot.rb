class Slot < ActiveRecord::Base

  belongs_to :jumper
  belongs_to :jump_type
  belongs_to :equipment
  
  def jumper_name
    jumper.name if jumper
  end

  def jump_type_name
    jump_type.name if jump_type
  end

  def equipment_name
    equipment.name if equipment
  end

end
