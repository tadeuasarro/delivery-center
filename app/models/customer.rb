class Customer < ApplicationRecord
  # I don't know about the business rules, so I'll just check the presence
  validates :externalCode, presence: true
  validates :name, presence: true
  validates :email, presence: true
  validates :contact, presence: true

  has_many :orders, foreign_key: :customerId
end
