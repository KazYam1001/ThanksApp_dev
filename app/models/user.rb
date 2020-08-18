class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  , :confirmable

  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users
  has_many :sended_thanks, class_name: 'Thank', foreign_key: 'sender_id', dependent: :destroy
  has_many :received_thanks, class_name: 'Thank', foreign_key: 'receiver_id', dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :thank_likes, class_name: "ThankLike", foreign_key: 'sender_id', dependent: :destroy
  has_many :sended_likes, class_name: 'UserLike', foreign_key: 'sender_id', dependent: :destroy
  has_many :received_likes, class_name: 'UserLike', foreign_key: 'receiver_id', dependent: :destroy
  has_many :recomends, class_name: 'Recomendation', foreign_key: 'recomender_id', dependent: :destroy
  has_many :electeds, class_name: 'Recomendation', foreign_key: 'electeder_id', dependent: :destroy
  has_many :recomend_comments, dependent: :destroy
  mount_uploader :avatar, ImageUploader


  # president: 社長, ul: ユニットリーダー, gl:グループリーダー
  # bl: エリア統括, sbl: 拠点統括, tl: チームリーダー, mem: メンバー


  # 先頭は文字列から始まり、末尾は@di-v.co.jpの形のemailを許可
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # ６文字以上の半角英数字を許可
  VALID_PASSWORD_REGEX = /\A[a-z0-9]{6,}/i

  validates :family_name, :given_name, presence: :true
  validate :email_custom_error
  # validates :email, format: {with: VALID_EMAIL_REGEX }
  validates :password, format: {with: VALID_PASSWORD_REGEX }, allow_nil: :true
  # , on: :"/users/confirmation?confirmation_token=abcdef"
  # 指定された値がenumのkeyだった場合は許可

  # 指定された値がenumのkeyだった場合は許可


   def email_custom_error
    if email.blank?
      errors[:email] << "を入力してください"
    elsif email.match(VALID_EMAIL_REGEX) == nil
      errors[:email] << "は不適切な値です"
    end
   end


  # def password_required?
  #   # confirmed?メソッドでconfirmed_atに値が入っているかを確認
  #   # 入っていればsuperでtrueに入る
  #   super if confirmed?
  # end
end
