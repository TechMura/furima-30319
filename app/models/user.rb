class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i

  validates :password, length:{minimum:6}, format:{ with: PASSWORD_REGEX }
  validates :nickname, presence: true, uniqueness: true
  validates :first_name, presence: true,format: {with: NAME_REGEX }
  validates :last_name, presence: true,format: {with: NAME_REGEX }
  validates :first_name_kana, presence: true,format: {with: NAME_KANA_REGEX }
  validates :last_name_kana, presence: true,format: {with: NAME_KANA_REGEX }
  validates :birthday, presence: true
  
end
