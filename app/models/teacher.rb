class Teacher < ApplicationRecord
  belongs_to :user
  has_many :matches
  has_many :students, through: :matches
  validates :user_id, presence: true
  validates :post_number, presence: true, length:{maximum:7}
  validates :appeal, presence: true, length:{maximum:140}

  geocoded_by :post_number
  after_validation :geocode

  #男性か女性かを判断する
  enum sex: {man: 10, woman: 20}


  def self.feed(user)
    @student = Student.find_by(user_id: user.id)
    if @student.japanese == 1
          japanese = Teacher.where(japanese: 1)
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

    teacher_subject = japanese | math | social | science | english

    @array = Array.new
    @array_distance = Array.new

    i = 0
    teacher_subject.each do |teacher|
      distance = User.distance(@student.latitude, @student.longitude, teacher.latitude, teacher.longitude)
      @array[i] = [teacher.user_id, distance.round(1)]

      @array_distance = [teacher.user_id, distance.round(1)]
      @array.insert(i,@array_distance)
      i += 1
    end

    @array_sort = @array.sort{ |a, b| a[1] <=> b[1] }
    @array_take = @array_sort[1..3]


    #その三人に対して一致している科目が何かを探す

    i = 0
    while i < 3
      subject = Array.new
      t = 0
      if Teacher.find_by(user_id: @array_take[i][0]).japanese == @student.japanese && @student.japanese == 1
        subject[t] = "japanese"
        t += 1
      end

      if Teacher.find_by(user_id: @array_take[i][0]).math == @student.math && @student.math == 1
        subject[t] = "math"
        t += 1
      end

      if Teacher.find_by(user_id: @array_take[i][0]).social == @student.social && @student.social == 1
        subject[t] = "social"
        t += 1
      end

      if Teacher.find_by(user_id: @array_take[i][0]).science == @student.science && @student.science == 1
        subject[t] = "science"
        t += 1
      end

      if Teacher.find_by(user_id: @array_take[i][0]).english == @student.english && @student.english == 1
        subject[t] = "english"
      end
      @array_take[i][2] = subject
      i += 1
    end
    return @array_take

  end


end
