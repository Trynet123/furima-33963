class TransactionAddress
  include ActiveModel::Model
  attr_accessor :item, :user, :postal_code, :prefecture_id, :cit, :house_number, :phone_number, :building_name, :item_transaction

  # ItemTransactionモデルのバリデーション
  # カード情報は１６桁の半角数字
  # セキュリティコードは四桁

  # Addresモデルのバリデーション
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: ""}
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: ""}
  end

  def save
    item_transaction = ItemTransaction.create(item: item.id, user: user.id)
    Address.create(
      postal_code: postal_code, 
      prefecture_id: prefecture_id, 
      city: city, 
      house_number: house_number, 
      phone_number: phone_number, 
      building_name: building_name, 
      item_transaction: item_transaction.id
    )
  end


end