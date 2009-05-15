class Transaction < ActiveRecord::Base

  belongs_to :account
  belongs_to :payment_method
  
  def self.sum_for_account(account_id)
    result = 0.0
    find_all_by_account_id(account_id).each do |transaction|
      result += transaction.amount
    end
    result
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