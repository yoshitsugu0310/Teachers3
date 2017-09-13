class Teacher < ApplicationRecord
  belongs_to :user
  has_many :matches
  has_many :students, through: :matches
  validates :user_id, presence: true
  validates :post_number, presence: true, length:{maximum:7}
  validates :appeal, presence: true, length:{maximum:140}

  geocoded_by :post_number
  after_validation :geocode

  def self.feed(user)
    @student = Student.find_by(user_id: user.id)
    if @student.japanese == 1
          @japanese = Teacher.where(japanese: 1)
        else
          japanese = Array.new
    end
    if @student.math == 1
          math = Teacher.where(math: 1)
        else
          math = Array.new
    end
    if @student.social == 1
          social = Teacher.where(social: 1)
        else
          social = Array.new
    end
    if @student.science == 1
          science = Teacher.where(science: 1)
        else
          science = Array.new
    end
    if @student.english == 1
          english = Teacher.where(english: 1)
        else
          english = Array.new
    end

    teacher_subject = @japanese | math | social | science | english

    @array = Array.new.map{Array.new(2,0)}
    i = 0
    teacher_subject.each do |teacher|
      distance = User.distance(@student.latitude, @student.longitude, teacher.latitude, teacher.longitude)
      @array[i] = [teacher.user_id, distance]
      i += 1

    end

    @array_sort = @array.sort{ |a, b| a[1] <=> b[1] }
    @array_take = @array_sort[1..3]

  end


end
