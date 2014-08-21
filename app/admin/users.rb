ActiveAdmin.register User do
  actions :index, :show

  index do                            
    column :email                     
    column :referral_code   
    column :referrer     
    column :created_at           
    column :prize_two_winner
    column :referral_count
    column :grand_prize_progress
    default_actions                   
  end
end
