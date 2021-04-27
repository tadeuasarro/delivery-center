class Customer < ApplicationRecord

  has_many :orders, foreign_key: :customerId

  def self.validate_customer params
    new_hash = {
      externalCode: params[:id],
      name: "#{params[:first_name].upcase} #{params[:last_name].upcase}",
      email: params[:email],
      contact:"#{params[:phone][:area_code]}#{params[:phone][:number]}",
    }
  end
end
