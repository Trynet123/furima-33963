class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/, message: 'を半角英数字混合で入力してください' }
  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'を全角で入力してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'を全角で入力してください' }
    validates :last_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: 'を全角カタカナで入力してください' }
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: 'を全角カタカナで入力してください' }
    validates :birth_day
  end

  has_many :items
  has_many :item_transactions
end
