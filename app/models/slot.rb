class Slot < ActiveRecord::Base

  belongs_to :account
  belongs_to :jump_type
  belongs_to :equipment
  
  def account_name
    account.name if account
  end

  def jump_type_name
    jump_type.name if jump_type
  end

  def equipment_name
    equipment.name if equipment
  end

end
