class Customer < ApplicationRecord
  has_many :orders, foreign_key: :customerId
end
