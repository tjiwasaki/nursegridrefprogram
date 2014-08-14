ActionMailer::Base.smtp_settings = {
    :address   => "smtp.mandrillapp.com",
    :port      => 587,
    :user_name => 'marketing@hct2.com',
    :password  => 'Jonov6540',
    :domain    => 'nursegridreferral.com'
  }
ActionMailer::Base.delivery_method = :smtp

MandrillMailer.configure do |config|
  config.api_key = 'ROZaAS7E9P65HJpy8QGdlA'
end