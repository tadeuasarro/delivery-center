class Customer < ApplicationRecord

  def validate_customer params
    new_hash = {
      externalCode: params[:id],
      name: "#{params[:first_name].upcase} #{params[:last_name].upcase}",
      email: params[:email],
      contact:"#{params[:phone][:area_code]}#{params[:phone][:number]}",
    }

    customer = Customer.new(new_hash)
    customer.save
    customer
  end
end
