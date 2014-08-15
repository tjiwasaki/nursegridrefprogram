class AddPrizeTwoWinnerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :prize_two_winner, :boolean
  end
end
