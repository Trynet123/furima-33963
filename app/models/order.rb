class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :phone_number, :building_name

  # Addresモデルのバリデーション
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: ""}
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: ""}
  end

  def save
    # パラムズから取得する
    item_transaction = ItemTransaction.create(item_id: , user_id: )
    Address.create(
      postal_code: postal_code, 
      prefecture_id: prefecture_id, 
      city: city, 
      house_number: house_number, 
      phone_number: phone_number, 
      building_name: building_name, 
      item_transaction_id: item_transaction.id
    )
  end
end