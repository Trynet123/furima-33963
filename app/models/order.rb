class Order
  include ActiveModel::Model
  attr_accessor :postal_code, 
                :prefecture_id, 
                :city, 
                :house_number, 
                :phone_number, 
                :building_name, 
                :item_id,     
                :user_id,
                :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid" }
    validates :prefecture_id
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid" }
    validates :house_number
    validates :phone_number, length: { maximum: 11 }, format: { with:/\A[0-9]+\z/, message: "is invalid"}
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    item_transaction = ItemTransaction.create(item_id: item_id, user_id: user_id )
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