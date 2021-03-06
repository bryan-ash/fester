class Search < ActiveRecord::Base

  def transactions
    scope = Transaction.scoped({ :include => [:account, :payment_method, :slot],
                                 :joins   => :account,
                                 :order   => 'updated_at DESC' })
    scope = scope.scoped :conditions => ['name ILIKE ?', "%#{account_name}%"] unless account_name.blank?
    scope = scope.scoped :conditions => ['payment_method_id = ?', payment_method_id] unless payment_method_id.blank?
    scope
  end

end
