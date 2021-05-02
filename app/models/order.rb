require 'uri'
require 'net/http'

class Order < ApplicationRecord
  belongs_to :customer, foreign_key: :customerId

  def self.create_order(params)
    parsed_params = OrderParser.parse(params)

    submit_to_database(parsed_params) if validate_json(parsed_params)
  end

  def self.validate_json(params)
    uri = URI.parse('https://delivery-center-recruitment-ap.herokuapp.com')

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri, {'Content-Type' => 'application/json'})
    request.body = params.to_json

    response = http.request(request)
    response.body.to_s == "OK"
  end

end
