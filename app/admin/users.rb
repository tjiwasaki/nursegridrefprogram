ActiveAdmin.register User do
  actions :index, :show

  index do   
    column :id                         
    column :email                     
    column :referral_code   
    column :referrer     
    column :created_at           
    column :prize_two_winner
    column :referral_count
    column :grand_prize_progress

    default_actions                   
  end

  csv do
    column :id
    column :email
    column :referral_code
    column :created_at
    column('Prize 2 Winner') {|user| (user.prize_two_winner ? 'true' : 'false')}
    column('Referrer') {|user| (user.referrer ? user.referrer.email : nil)}
    column('Referral Count') {|user| user.referral_count}
    column('Grand Prize Tickets') {|user| user.grand_prize_progress}

  end

end
