class Item < ApplicationRecord
  has_many :item_order_relation, foreign_key: :item_id
  has_many :orders, through: :item_order_relation
end
