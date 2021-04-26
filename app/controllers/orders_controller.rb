class OrdersController < ApplicationController

  def create

    Rails.logger.debug params

    redirect_to root_path

  end

end
