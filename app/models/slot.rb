class Slot < ActiveRecord::Base

  belongs_to :account
  belongs_to :jump_type
  belongs_to :equipment

  has_one :transaction

  after_save :associate_transaction
  
  def account_name
    account.name if account
  end

  def jump_type_name
    jump_type.name if jump_type
  end

  def equipment_name
    equipment.name if equipment
  end

  def date
    return Date.today unless self[:load]
    load.date
  end

  def associate_transaction
    Transaction.find_or_create_by_slot_id(:slot_id => id,
                                          :account => account,
                                          :notes   => jump_type_name,
                                          :amount  => cost,
                                          :date    => date)
  end

end
