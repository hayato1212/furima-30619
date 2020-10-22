class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/.freeze
  validates :password,        format: { with: VALID_PASSWORD_REGEX , message: "半角英数字混合で記入してください" }
  validates :nickname,        presence: true
  validates :last_name,       presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "ひらがな、カタカナ、漢字のいずれかで記入してください" }
  validates :first_name,      presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "ひらがな、カタカナ、漢字のいずれかで記入してください" }
  validates :last_name_kana,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "カタカナで記入してください" }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "カタカナで記入してください" }
  validates :birthday,        presence: true
end
