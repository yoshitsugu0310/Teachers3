class Teacher < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :post_number, presence: true, length:{maximum:7}
  validates :appeal, presence: true, length:{maximum:140}

  geocoded_by :post_number
  after_validation :geocode

  def self.feed
   self.all
   
 end

end
