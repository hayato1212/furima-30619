class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :category_id
    validates :price
    validates :status_id
    validates :description
    validates :prefecture_id
    validates :date_of_shipment_id
    validates :burden_id
    validates :image

    belongs_to :user
    has_one_attached :image
end
