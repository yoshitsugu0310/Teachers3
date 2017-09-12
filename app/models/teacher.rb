class Teacher < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :post_number, presence: true, length:{maximum:7}
  validates :appeal, presence: true, length:{maximum:140}

  geocoded_by :post_number
  after_validation :geocode

  def self.feed
      subject = Array.new
      i = 0
      if current_user.id == 1
         subject[i] = "japanese"
         i += 1
       elsif current_user.math == 1
         subject[i] = "math"
         i += 1
       elsif current_user.social == 1
         subject[i] = "social"
         i += 1
       elsif current_user.science == 1
         subject[i] = "science"
         i += 1
       elsif current_user.english == 1
         subject[i] = "english"
       end

       l = subject.length
       n = 0
      while n < l
        Teacher.where(subject[n] = "1")
        i += 1
      end




 end



end
