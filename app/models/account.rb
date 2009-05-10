class Account < ActiveRecord::Base

  def self.pilots
    find_all_by_pilot(true)
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

end
