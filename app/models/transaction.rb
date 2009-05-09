class Transaction < ActiveRecord::Base

  def self.sum_for_account(account_id)
    sum(:amount, :conditions => ['account_id == ?', account_id])
  end

end
