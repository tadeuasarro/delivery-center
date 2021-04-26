class Order < ApplicationRecord
  def self.create_order params
    customer = Customer.new()
    customer.validate_customer(params[:buyer])

    Rails.logger.debug customer.name

    Order.new()
  end

end
