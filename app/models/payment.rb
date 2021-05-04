class Payment < ApplicationRecord
  def self.create_payment(params)
    payment = Payment.new(params.except(:type))
    payment.paymentType = params[:type]
    return :bad_request unless payment.save
  end
end
