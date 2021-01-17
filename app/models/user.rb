class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/, message: 'Include both letters and numbers' }
  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'Full-width characters' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'Full-width characters' }
    validates :last_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: 'kana Full-width katakana characters' }
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: 'kana Full-width katakana characters' }
    validates :birth_day
  end
end
