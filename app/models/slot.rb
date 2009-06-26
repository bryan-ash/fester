class Slot < ActiveRecord::Base

  belongs_to :account
  belongs_to :jump_type
  belongs_to :equipment

  has_one :transaction, :dependent => :destroy

  after_save :create_or_update_transaction
  
  def account_name
    account.name if account
  end

  def account_name=(name)
    self.account = Account.find_or_create_by_name(name) unless name.blank?
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

  def create_or_update_transaction
    transaction = Transaction.find_or_create_by_slot_id(:slot_id => id)

    transaction.update_attributes(:account => account,
                                  :notes   => jump_type_name,
                                  :amount  => cost,
                                  :date    => date)
  end

end
