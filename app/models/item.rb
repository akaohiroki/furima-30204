class Item < ApplicationRecord

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000}
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :shipping_charge_id
      validates :prefecture_id
      validates :shipping_day_id
    end
    validates :price, format: {with: /\A[0-9]+\z/ }, numericality: { :greater_than_or_equal_to => 300 }, numericality: { :less_than_or_equal_to => 9999999 }
    validates :image
  end

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :Prefecture
  belongs_to :shipping_day
end