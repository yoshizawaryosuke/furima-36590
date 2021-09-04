class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :condition
  belongs_to :postage
  belongs_to :days
end
