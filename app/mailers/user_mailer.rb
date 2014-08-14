# class UserMailer < ActionMailer::Base
#     default from: "NurseGrid Marketing <marketing@nursegridreferral.com>"

#     def signup_email(user)
#         @user = user
#         @twitter_message = "I can't wait for @NurseGrid to launch. It's an app for nurses, by nurses. Join today nurse friends: nursegrid.com/referrals/?ref=#{@user.referral_code} #nursegrid"

#         mail(:to => user.email, :subject => "Welcome to NurseGrid!")
#     end
# end



class UserMailer < MandrillMailer::TemplateMailer
  default from: 'marketing@nursegridreferral.com'

  def signup_email(user)
    # in this example `invitation.invitees` is an Array
    
    mandrill_mail template: 'referral-program-verification',
                  subject: 'Welcome to NurseGrid!',
                  to: user.email,
                  vars: {
                    'REFERRAL_CODE' => "nusregridreferral.com/?ref=#{user.referral_code}"
                  },
                  important: true,
                  inline_css: true

  end
end