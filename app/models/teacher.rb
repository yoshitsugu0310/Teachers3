class Teacher < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :post_number, presence: true, length:{maximum:7}
  validates :appeal, presence: true, length:{maximum:140}

  def self.feed
   self.all
 end

end
