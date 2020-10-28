class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :date_of_shipment

  with_options presence: true do
    validates :name,                length: { maximum: 40 }
    validates :category_id,         numericality: { other_than: 1 }
    validates :price,               format: { with: /\A[0-9]+\z/ }, inclusion: { in: 300..9999999 }
    validates :status_id,           numericality: { other_than: 1 }
    validates :description,         length: { in: 7..1000 }
    validates :prefecture_id,       numericality: { other_than: 1 }
    validates :date_of_shipment_id, numericality: { other_than: 1 }
    validates :burden_id,           numericality: { other_than: 1 }
    validates :image
  end

  belongs_to :user
  has_one_attached :image
end
