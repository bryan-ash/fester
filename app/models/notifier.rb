class Notifier < ActionMailer::Base  
  
  def password_reset_instructions(user)
    subject    "YouGoJumping Password Reset Instructions"
    from       "YouGoJumping"
    recipients user.email
    sent_on    Time.now
    body       :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end  

end
