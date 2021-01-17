class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id 
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :days_to_ship_id
    validates :price, 
      numericality: {
        greater_than_or_equal_to: 300, 
        less_than_or_equal_to: 9999999, 
        only_integer: true, 
        message: "Out of setting range"
      },
      format: { with: /\A[0-9]+\z/, message: "Half-width number"}
  end
  
  belongs_to :user
end
