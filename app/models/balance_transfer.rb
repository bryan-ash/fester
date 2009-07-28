class BalanceTransfer

  attr_accessor :amount
  attr_accessor :date

  def from_account_name
    @from_account.name if @from_account
  end

  def from_account_name=(account_name)
    @from_account = Account.find_by_name account_name
  end

  def to_account_name
    @to_account.name if @to_account
  end

  def to_account_name=(account_name)
    @to_account = Account.find_by_name account_name
  end

  def save
    @from_account.transfer @to_account, @amount.to_f, @date
  end

  def id
    # this only exists to quite ActionController::RecordIdentifier warning
    # about using Object#id
  end

end
