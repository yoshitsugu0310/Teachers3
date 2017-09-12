class Review < ApplicationRecord
  belongs_to :user

  #レビューの平均値
  def self.get_review_average
   average(:review)
  end
end
