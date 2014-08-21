class UserMailer < MandrillMailer::TemplateMailer
  default from: 'marketing@nursegridreferral.com'

  def referral_confirmation(user)
    mandrill_mail template: 'referral-program-point-confirmation',
                  subject: 'A friend has just used your referral code!',
                  to: user.email,
                  vars: {
                    'REFERRAL_COUNT' => user.referral_count,
                    'REFERRAL_CODE' => "nursegridreferral.com/?ref=#{user.referral_code}"
                  },
                  important: true,
                  inline_css: true
  end

  def signup_email(user)    
    mandrill_mail template: 'referral-program-verification',
                  subject: 'Welcome to NurseGrid!',
                  to: user.email,
                  vars: {
                    'REFERRAL_CODE' => "nursegridreferral.com/?ref=#{user.referral_code}"
                  },
                  important: true,
                  inline_css: true
  end
end