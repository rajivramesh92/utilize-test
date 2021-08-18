class CouriersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: :show

  def index
    @couriers = current_user.received_orders
  end

  def search_order
    @courier = Courier.find_by(order_number: params[:order_number])
    if @courier.present?
      redirect_to courier_path(@courier.id)
    else
      @couriers = current_user.received_orders
      render 'index'
    end
  end

  def new
    @courier = current_user.couriers.build
    @users = User.where.not(id: current_user.id).pluck(:full_name, :id)
  end

  def create
    @courier = current_user.couriers.create(courier_params)
    if @courier.valid?
      redirect_to couriers_path
    else
      @users = User.where.not(id: current_user.id).includes(:address).pluck(:full_name, :id)
      render 'new'
    end
  end

  private

  def courier_params
    params.require(:courier).permit(:weight, :cost, :receiver_id, :payment_mode, :service_type)
  end

  def set_order
    @courier = Courier.find(params[:id])
  end
end
