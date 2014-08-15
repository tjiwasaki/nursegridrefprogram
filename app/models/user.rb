class User < ActiveRecord::Base
    belongs_to :referrer, :class_name => "User", :foreign_key => "referrer_id"
    has_many :referrals, :class_name => "User", :foreign_key => "referrer_id"
    
    attr_accessible :email

    validates :email, :uniqueness => true, :format => { :with => /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i, :message => "Invalid email format." }
    validates :referral_code, :uniqueness => true

    before_create :create_referral_code
    after_create :send_welcome_email

    # REFERRAL_STEPS = [
    #   {
    #     'count' => 10,
    #     "title" => "A mug, badge reel, and pens!",
    #     "description" => "<h4>Refer 10 friends to NurseGrid and we'll send you:</h4><ul><li>NurseGrid t-shirt</li><li>BPA-free coffee travel mug</li><li>A nurse badge reel</li><li>A set of NurseGrid pens</li></ul>",
    #     "class" => "prize-one",
    #     "image" =>  ActionController::Base.helpers.asset_path("nursegrid_prize_one.jpg")
    #   },
    #   {
    #     'count' => 20,
    #     'remaining'=> 30,
    #     "title" => "$50 in Scrubs!",
    #     "description" => "<p>The first 30 nurses to get 20 of their friends to join NurseGrid will receive a $50 gift card to NWScrubs! Happy Shopping</p>",

    #     "class" => "prize-two",
    #     "image" => ActionController::Base.helpers.asset_path("nursegrid_prize_two.jpg")
    #   },
    #   {
    #     'count' => 100,
    #     'title' => '$750 JetBlue',
    #     'description' => "for every nurse you refer to NurseGrid, we will enter you into the grand prize drawing for a chance to win a <span>$750 Jetblue travel gift card!</span>.",
    #     'class' => 'prize-grand',
    #     'image' => ActionController::Base.helpers.asset_path("nursegrid_prize_grand.jpg")
    #   }
    # ]

    GRAND_PRIZE_STEPS = [
      {
        'step' => 1,
        'referrals' => 1,
        'tickets' => 1
      },
      {
        'step' => 2,
        'referrals' => 16,
        'tickets' => 4
      },
      {
        'step' => 3,
        'referrals' => 21,
        'tickets' => 6
      },
      {
        'step' => 4,
        'referrals' => 26,
        'tickets' => 8
      },
      {
        'step' => 5,
        'referrals' => 31,
        'tickets' => 10
      },
      {
        'step' => 6,
        'referrals' => 36,
        'tickets' => 12
      },
      {
        'step' => 7,
        'referrals' => 41,
        'tickets' => 14
      },
      {
        'step' => 8,
        'referrals' => 51,
        'tickets' => 16
      }
    ]

    def grand_prize_progress
      count = self.referrals.count
      if count <= 15
        return count
      elsif count > 15 && count <= 20
        return count + (3*(count - 15))
      elsif count < 20 && count <= 25
        return count + (5*(count - 17))
      elsif count > 25 && count <= 30
        return 73 + (8*(count-26))
      elsif count > 30 && count <= 35
        return 115 + (10*(count-31))
      elsif count > 35 && count <= 40
        return 167 + (12*(count-36))
      elsif count > 40 && count <= 50
        return 229 + (14*(count-41))
      elsif count > 50
        return 371 + (16*(count-51))
      end

    end
    
    def check_prize_level
      prize_two = Prize.find_by_prize_count(20)
      if self.referrals.count == 19
        prize_two.remaining -=1
        prize_two.save
      end
    end

    private

    def create_referral_code
        referral_code = SecureRandom.hex(5)
        @collision = User.find_by_referral_code(referral_code)

        while !@collision.nil?
            referral_code = SecureRandom.hex(5)
            @collision = User.find_by_referral_code(referral_code)
        end

        self.referral_code = referral_code
    end

    def send_welcome_email
      UserMailer.signup_email(self).deliver
    end
    handle_asynchronously :send_welcome_email
end
