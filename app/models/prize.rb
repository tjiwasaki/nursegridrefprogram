class Prize < ActiveRecord::Base
  attr_accessible :prize_class, :prize_count, :description, :image, :title, :remaining
end
