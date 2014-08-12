class UserMailer < ActionMailer::Base
    default from: "Harry's <welcome@harrys.com>"

    def signup_email(user)
        @user = user
        @twitter_message = "I can't wait for @NurseGrid to launch. It's an app for nurses, by nurses. Join today nurse friends: nursegrid.com/referrals/?ref=#{@user.referral_code} #nursegrid"

        mail(:to => user.email, :subject => "Thanks for signing up!")
    end
end
