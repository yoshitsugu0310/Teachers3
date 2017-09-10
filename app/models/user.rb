class User < ApplicationRecord
  has_one :student, dependent: :destroy
  has_one :teacher, dependent: :destroy
  has_many :reviews, dependent: :destroy

  attr_accessor :remember_token, :activation_token, :reset_token
  before_save :downcase_email
  before_create :create_activation_digest
  validates :name, presence: true, length:{maximum:50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length:{maximum:255},
    format: { with: VALID_EMAIL_REGEX },
    uniqueness:  { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  #先生か生徒かを判別する値
  enum status: {student: 10, teacher: 20}


  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # 永続セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # 渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # ユーザーのログイン情報を破棄する
  def forget
    update_attribute(:remember_digest, nil)
  end

  # パスワード再設定の期限が切れている場合はtrueを返す
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end



  #レビューの平均値
 def get_review_average
   Review.average(:review)
 end

 #緯度経度による二点間の距離(km)
 def self.distance(lat1, lng1, lat2, lng2)
   # ラジアン単位に変換
  x1 = lat1.to_f * Math::PI / 180
  y1 = lng1.to_f * Math::PI / 180
  x2 = lat2.to_f * Math::PI / 180
  y2 = lng2.to_f * Math::PI / 180

  # 地球の半径 (km)
  radius = 6378.137

  # 差の絶対値
  diff_y = (y1 - y2).abs

  calc1 = Math.cos(x2) * Math.sin(diff_y)
  calc2 = Math.cos(x1) * Math.sin(x2) - Math.sin(x1) * Math.cos(x2) * Math.cos(diff_y)

  # 分子
  numerator = Math.sqrt(calc1 ** 2 + calc2 ** 2)

  # 分母
  denominator = Math.sin(x1) * Math.sin(x2) + Math.cos(x1) * Math.cos(x2) * Math.cos(diff_y)

  # 弧度
  degree = Math.atan2(numerator, denominator)

  # 大円距離 (km)
  degree * radius
end






  private

  #メールアドレスをすべて小文字にする
  def downcase_email
    self.email = email.downcase
  end

  def create_activation_digest
    # 有効化トークンとダイジェストを作成および代入する
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  # アカウントを有効にする
    def activate
      update_attribute(:activated,    true)
      update_attribute(:activated_at, Time.zone.now)
    end

    # 有効化用のメールを送信する
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  # パスワード再設定の属性を設定する
    def create_reset_digest
      self.reset_token = User.new_token
      update_attribute(:reset_digest,  User.digest(reset_token))
      update_attribute(:reset_sent_at, Time.zone.now)
    end

    # パスワード再設定のメールを送信する
    def send_password_reset_email
      UserMailer.password_reset(self).deliver_now
    end

end
