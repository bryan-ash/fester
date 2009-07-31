
class Account < ActiveRecord::Base

  has_many   :transactions
  belongs_to :user

  attr_reader :balance_adjustment
  
  def self.pilots
    find_all_by_pilot(true)
  end

  def self.search(search)
    if search
      all :conditions => ['name ILIKE ?', "%#{search}%"], :order => 'name ASC'
    else
      all :order => 'name ASC'      
    end    
  end

  def roles
    roles = []
    roles << 'Jumper' if   jumper
    roles << 'Pilot'  if   pilot
    roles << 'None' unless roles.any?
    roles
  end

  def balance
    Transaction.sum_for_account(id)
  end

  def balance_adjustment=(amount)
    self.transactions.build(:amount => amount.to_f,
                            :date   => Date.today,
                            :notes  => 'Balance adjustment')
  end

  def transfer(to_account, amount, date)
    Transaction.transaction do
      self.transactions.create(:amount => amount,
                               :date   => date,
                               :notes  => 'Balance transfer')

      to_account.transactions.create(:amount => -amount,
                                     :date   => date,
                                     :notes  => 'Balance transfer')
    end    
  end

end
