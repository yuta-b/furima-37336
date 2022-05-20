class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,        presence: true
  validates :first_name,      presence: true
  validates :first_name_kana, presence: true
  validates :last_name,       presence: true
  validates :last_name_kana,  presence: true
  validates :birth_day,       presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :encrypted_password, with: VALID_PASSWORD_REGEX, message: 'パスワードは英字と数字の両方を含めて設定してください'

  has_many :items
  
end
