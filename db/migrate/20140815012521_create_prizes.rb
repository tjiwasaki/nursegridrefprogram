class CreatePrizes < ActiveRecord::Migration
  def change
    create_table :prizes do |t|
      t.integer :prize_count
      t.integer :remaining
      t.string :title
      t.text :description
      t.string :prize_class
      t.string :image

      t.timestamps
    end
  end
end
