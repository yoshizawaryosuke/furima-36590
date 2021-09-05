class Item < ApplicationRecord
  belongs_to :user
  #has_one :buy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :condition
  belongs_to :postage
  belongs_to :scheduled_delivery

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_text
   with_options numericality: { other_than: 0 , message: "can't be blank"} do
     validates :category_id
     validates :condition_id
     validates :prefecture_id
     validates :postage_id
     validates :scheduled_delivery_id
   end
    validates :price, numericality: { with: /\A[0-9]+\z/}
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
  end
end
