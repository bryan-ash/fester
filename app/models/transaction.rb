class Transaction < ActiveRecord::Base

  belongs_to :account
  belongs_to :payment_method
  belongs_to :slot

  def self.sum_for_account(account_id)
    return 0 if account_id.nil?
    find_all_by_account_id(account_id).sum(&:amount)
  end

  def account_name
    account.name if account
  end

  def account_name=(name)
    self.account = Account.find_or_create_by_name(name) unless name.blank?
  end

  def payment_method_name
    payment_method.name if payment_method
  end

  def amount
    return self[:amount] unless payment_method
    payment_method.signed_amount(self[:amount])
  end

  def editable
    not self.slot
  end

end
