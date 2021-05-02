class OrdersController < ApplicationController
  def create
    order = Order.create_order(params)

    render json: order
  end
end
