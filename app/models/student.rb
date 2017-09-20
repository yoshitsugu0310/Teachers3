class Student < ApplicationRecord
  belongs_to :user
  has_many :matches
  has_many :teachers, through: :matches
  validates :user_id, presence: true
  validates :post_number, presence: true, length:{maximum:7}

  geocoded_by :post_number
  after_validation :geocode

  #男性か女性かを判断する
  enum sex: {man: 10, woman: 20}


  def check_subject
    @subject = Array.new

  end

  def self.feed(user)
    #自分（教師）を取得
    @teacher = Teacher.find_by(user_id: user.id)
    #教師が選択した科目なら生徒側から引っ張ってくる
    if @teacher.japanese == 1
          japanese = Student.where(japanese: 1)
        else
          japanese = Array.new
    end
    if @teacher.math == 1
          math = Student.where(math: 1)
        else
          math = Array.new
    end
    if @teacher.social == 1
          social = Student.where(social: 1)
        else
          social = Array.new
    end
    if @teacher.science == 1
          science = Student.where(science: 1)
        else
          science = Array.new
    end
    if @teacher.english == 1
          english = Student.where(english: 1)
        else
          english = Array.new
    end

    #重複を無くすための和集合
    student_subject = japanese | math | social | science | english

    #科目が一致している生徒と先生の距離を算出
    @array = Array.new
    @array_distance = Array.new
    i = 0
    student_subject.each do |student|
      distance = User.distance(@teacher.latitude, @teacher.longitude, student.latitude, student.longitude)

      @array_distance = [student.user_id, distance.round(1)]
      @array.insert(i,@array_distance)
      i += 1

    end

    #距離が近い順に並び替えて3人取り出す
    @array.sort{ |a, b| a[1] <=> b[1] }
    @array_take = @array[1..3]

    #その三人に対して一致している科目が何かを探す
    i = 0
    while i < 3
      subject = Array.new
      t = 0
      if Student.find_by(user_id: @array_take[i][0]).japanese == @teacher.japanese && @teacher.japanese == 1
        subject[t] = "japanese"
        t += 1
      end

      if Student.find_by(user_id: @array_take[i][0]).math == @teacher.math && @teacher.math == 1
        subject[t] = "math"
        t += 1
      end

      if Student.find_by(user_id: @array_take[i][0]).social == @teacher.social && @teacher.social == 1
        subject[t] = "social"
        t += 1
      end

      if Student.find_by(user_id: @array_take[i][0]).science == @teacher.science && @teacher.science == 1
        subject[t] = "science"
        t += 1
      end

      if Student.find_by(user_id: @array_take[i][0]).english == @teacher.english && @teacher.english == 1
        subject[t] = "english"
      end
      @array_take[i][2] = subject
      i += 1
    end
    return @array_take
  end
end
