class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,           presence: true
  validates :email,              presence: true
  validates :first_name,         presence: true
  validates :first_name_kana,    presence: true
  validates :last_name,          presence: true
  validates :last_name_kana,     presence: true
  validates :birth_day,          presence: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: VALID_PASSWORD_REGEX, message: 'は英字と数字の両方を含めて設定してください'

  #has_many :items
  
end
