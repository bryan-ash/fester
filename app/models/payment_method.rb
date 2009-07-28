class PaymentMethod < ActiveRecord::Base

  def signed_amount(amount)
    credit ? -amount : amount
  end

end
