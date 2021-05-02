class Order < ApplicationRecord
  require 'faraday'

  belongs_to :customer, foreign_key: :customerId

  def self.create_order(params)
    json_validation(OrderParser.parse(params))
  end

  def self.json_validation(params)
    url = 'https://delivery-center-recruitment-ap.herokuapp.com'

    res ||= Faraday.post("#{url}#{service_path}") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['X-Sent'] = Time.zone.now.strftime('%Hh%M - %D')
      req.body = payload.to_json
    end

    res
  end

end
