require 'uri'
require 'net/http'

class Order < ApplicationRecord
  # I don't know about the business rules, so I'll just check the presence
  validates :externalCode, presence: true
  validates :storeId, presence: true
  validates :subTotal, presence: true
  validates :deliveryFee, presence: true
  validates :total_shipping, presence: true
  validates :total, presence: true
  validates :city, presence: true
  validates :district, presence: true
  validates :street, presence: true
  validates :complement, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :dtOrderCreate, presence: true
  validates :postalCode, presence: true
  validates :number, presence: true
  validates :customerId, presence: true
  validates :country, presence: true
  validates :state, presence: true

  belongs_to :customer, foreign_key: :customerId

  has_many :item_order_relation, foreign_key: :order_id
  has_many :items, through: :item_order_relation

  def self.create_order(params)
    parsed_params = OrderParser.parse(params)
    return :bad_request unless validate_json(parsed_params)

    submit_to_database(parsed_params)
  end

  def self.validate_json(params)
    uri = URI.parse('https://delivery-center-recruitment-ap.herokuapp.com')

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri, { 'Content-Type' => 'application/json' })
    request.body = params.to_json

    response = http.request(request)

    response.body.to_s == 'OK'
  end

  def self.submit_to_database(params)
    customer = submit_customer(params[:customer])
    order = submit_order(params, customer.id)
    submit_items(params[:items], order.id)
    submit_payments(params[:payments], order.id)
  end

  def self.submit_customer(params)
    customer = Customer.find_by(name: params[:name])

    unless customer
      customer = Customer.new(params)
      return :bad_request unless customer.save
    end

    customer
  end

  def self.submit_order(params, id)
    order = Order.new(params.except(:items, :payments, :customer).merge(customerId: id))
    return :bad_request unless order.save

    order
  end

  def self.submit_items(params, id)
    params.each do |element|
      item = Item.find_by(externalCode: element[:externalCode])

      unless item
        item = Item.new(element.except(:subItems))
        return :bad_request unless item.save
      end

      ior_params = { item_id: item.id, order_id: id }
      item_order_relation = ItemOrderRelation.new(ior_params)
      return :bad_request unless item_order_relation.save
    end

    true
  end

  def self.submit_payments(params, id)
    params.each do |element|
      Payment.create_payment(element.merge(orderId: id))
    end

    true
  end
end
