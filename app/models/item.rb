class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :condition
  belongs_to :days_to_ship
  belongs_to :shipping_charge
  
  belongs_to :user
  has_one_attached :image

  with_options numericality: { other_than: 1} do
    validates :category_id 
    validates :condition_id
    validates :shipping_charge_id
    validates :days_to_ship_id
    validates :prefecture_id
  end

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price, 
      numericality: {
        greater_than_or_equal_to: 300, 
        less_than_or_equal_to: 9999999, 
        only_integer: true, 
        message: "Out of setting range"
      }
  end
end