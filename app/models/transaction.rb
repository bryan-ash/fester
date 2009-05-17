class Transaction < ActiveRecord::Base

  belongs_to :account
  belongs_to :payment_method
  
  def self.sum_for_account(account_id)
    find_all_by_account_id(account_id).sum { |transaction| transaction.amount }
  end

  def account_name
    account.name if account
  end

  def payment_method_name
    payment_method.name if payment_method
  end

  def amount
    return self[:amount] unless payment_method
    payment_method.signed_amount(self[:amount])
  end

end
