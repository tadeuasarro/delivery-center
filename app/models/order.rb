class Order < ApplicationRecord
  belongs_to :customer, foreign_key: :customerId

  def self.create_order params
    customer = Customer.validate_customer(params[:buyer])

    order = Order.fix_order_params(params)

    customer = Order.fix_customer_params(params[:buyer])

    items = Order.fix_items_params(params[:order_items])
    order.merge({
      customer: customer,
      items: items
      })
  end

  def self.fix_order_params params
    new_hash = {
      externalCode: params[:id],
      storeId: params[:store_id],
      subTotal: params[:total_amount],
      deliveryFee: params[:total_shipping].to_s,
      total_shipping: params[:total_shipping],
      total: params[:total_amount_with_shipping].to_s,
      country: params[:shipping][:receiver_address][:country][:id],
      state: params[:shipping][:receiver_address][:state][:name],
      city: params[:shipping][:receiver_address][:city][:name],
      district: params[:shipping][:receiver_address][:neighborhood][:name],
      street: params[:shipping][:receiver_address][:street_name],
      complement: params[:shipping][:receiver_address][:comment],
      latitude: params[:shipping][:receiver_address][:latitude],
      longitute:  params[:shipping][:receiver_address][:longitude],
      dtOrderCreated: params[:date_created],
      postalCode: params[:shipping][:receiver_address][:zip_code],
      number: params[:shipping][:receiver_address][:street_number],
    }
  end

  def self.fix_customer_params params
    new_hash = {
      externalCode: params[:id],
      name: "#{params[:first_name].upcase} #{params[:last_name].upcase}",
      email: params[:email],
      contact:"#{params[:phone][:area_code]}#{params[:phone][:number]}",
    }
  end

  def self.fix_items_params params
    new_array = []

    params.each do |element|
      new_array.push({
        externalCode: element[:item][:id],
        name: element[:item][:title],
        price: element[:unit_price],
        quantity: element[:quantity],
        total: element[:full_unit_price],
        subItems: [],
      })
    end

    new_array
  end
end
