class Customer < ApplicationRecord

  has_many orders

  def self.validate_customer params
    new_hash = {
      externalCode: params[:id],
      name: "#{params[:first_name].upcase} #{params[:last_name].upcase}",
      email: params[:email],
      contact:"#{params[:phone][:area_code]}#{params[:phone][:number]}",
    }

    customer = Customer.find_by(name: new_hash[:name])

    customer = Customer.new(new_hash) if customer.nil?
    customer.save

    customer
  end
end
