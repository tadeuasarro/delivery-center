class Item < ApplicationRecord
  # I don't know about the business rules, so I'll just check the presence
  validates :externalCode, presence: true
  validates :name, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
  validates :total, presence: true

  has_many :item_order_relation, foreign_key: :item_id
  has_many :orders, through: :item_order_relation
end
