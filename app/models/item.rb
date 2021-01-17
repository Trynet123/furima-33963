class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :user
  has_one_attached :image

  validates :prefecture_id, numericality: { other_than: 1}
  with_options presence: true do
    validates :name
    validates :text
    validates :category_id 
    validates :condition_id
    validates :shipping_charge_id
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
end
