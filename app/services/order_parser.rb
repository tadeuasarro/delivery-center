class OrderParser
  def self.parse params
    new_hash = order_parse(params)
    new_hash.merge({
      customer: customer_parse(params[:buyer]),
      items: items_parse(params[:order_items]),
      payments: payments_parse(params[:payments])
    })
  end

  def self.order_parse(params)
    new_hash = {
      externalCode: params[:id],
      storeId: params[:store_id],
      subTotal: params[:total_amount],
      deliveryFee: params[:total_shipping].to_s,
      total_shipping: params[:total_shipping],
      total: params[:total_amount_with_shipping].to_s,
      dtOrderCreate: params[:date_created],
    }

    new_hash.merge(address_parse(params[:shipping][:receiver_address]))
  end

  def self.customer_parse(params)
    new_hash = {
      externalCode: params[:id],
      name: "#{params[:first_name].upcase} #{params[:last_name].upcase}",
      email: params[:email],
      contact: "#{params[:phone][:area_code]}#{params[:phone][:number]}"
    }
  end

  def self.items_parse(params)
    new_array = []

    params.each do |element|
      new_array.push({
                       externalCode: element[:item][:id],
                       name: element[:item][:title],
                       price: element[:unit_price],
                       quantity: element[:quantity],
                       total: element[:full_unit_price],
                       subItems: []
                     })
    end

    new_array
  end

  def self.address_parse(params)
    new_hash = {
      postalCode: params[:zip_code],
      number: params[:street_number],
      country: params[:country][:id],
      state: params[:state][:name],
      city: params[:city][:name],
      district: params[:neighborhood][:name],
      street: params[:street_name],
      complement: params[:comment],
      latitude: params[:latitude],
      longitude: params[:longitude]
    }
  end

  def self.payments_parse(params)
    new_array = []

    params.each do |element|
      new_array.push({
                       type: element[:payment_type],
                       value: element[:total_paid_amount],
                     })
    end

    new_array
  end
end