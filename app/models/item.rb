class Item < ApplicationRecord

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000}
    validates :category_id
    validates :condition_id
    validates :shipping_charges_id
    validates :prefecture_id
    validates :shipping_days_id
    validates :price, format: {with: /\A[0-9]+\z/ }, numericality: { :greater_than_or_equal_to => 300 }, numericality: { :less_than_or_equal_to => 9999999 }
    validates :image
  end

  belongs_to :user
  has_one_attached :image
end