class Order < ApplicationRecord
  belongs_to customer
  def self.create_order params
    customer = Customer.validate_customer(params[:buyer])

    order = Order.new()

    Rails.logger.debug customer.id
  end

end
