class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Last name Full-width characters" }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "First name Full-width characters" }
    validates :last_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "Last name kana Full-width katakana characters" }
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "First name kana Full-width katakana characters" }
    validates :birth_day
    validates :encrypted_password, format: { with: /\A[a-zA-Z0-9]+\z/, message: "Password include both letters and numbers" }
  end
end