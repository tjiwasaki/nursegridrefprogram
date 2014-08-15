# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(:email => 'admin@nursegridreferral.com', :password => 'ngrefadminpass', :password_confirmation => 'ngrefadminpass')

Prize.create!(prize_count: 10, title: "A mug, badge reel, and pens!", description: nil, remaining: nil, prize_class: "prize-one", image: "nursegrid_prize_one.jpg")

Prize.create!(prize_count: 20, title: "$50 in Scrubs!", description: "The first 30 nurses to get 20 of their friends to join NurseGrid will receive a $50 gift card to NWScrubs! Happy Shopping", remaining: 30, prize_class: "prize-two", image: "nursegrid_prize_two.jpg")

Prize.create!(prize_count: 30, title: "$750 JetBlue", description: "for every nurse you refer to NurseGrid, we will enter you into the grand prize drawing for a chance to win a <span>$750 Jetblue travel gift card!</span>.", remaining: nil, prize_class: "prize-grand", image: nil)