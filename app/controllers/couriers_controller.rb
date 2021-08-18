class CouriersController < ApplicationController
  before_action :authenticate_user!

  def index
    @couriers = current_user.received_orders
  end

  def new
    @courier = current_user.couriers.new
    @users = User.pluck(:full_name, :id)
  end

  def create
    @courier = current_user.couriers.create(courier_params)
    if @courier.valid?
      redirect_to couriers_path
    else
      render 'new'
    end
  end

  private

  def courier_params
    params.require(:courier).permit(:weight, :cost, :receiver_id, :payment_mode, :service_type)
  end
end
