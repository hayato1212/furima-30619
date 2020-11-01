class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :date_of_shipment

  with_options presence: true do
    validates :name,                length: { maximum: 40 }
    validates :price,               format: { with: /\A[0-9]+\z/ }, inclusion: { in: 300..9_999_999 }
    validates :description,         length: { maximum: 1000 }
    validates :image
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :prefecture_id
    validates :date_of_shipment_id
    validates :burden_id
    validates :status_id
    validates :category_id
  end

  belongs_to :user
  has_one_attached :image
end
