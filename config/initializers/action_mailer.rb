require "smtp_tls"

ActionMailer::Base.smtp_settings = {
  :address        => "smtp.gmail.com",
  :port           => 587,
  :authentication => :plain,
  :user_name      => "fester.mailer@gmail.com",
  :password       => 'festerfaster'}
