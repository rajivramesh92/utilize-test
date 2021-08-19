class CouriersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: :show

  def index
    @received_orders = current_user.received_orders
    @sent_orders = current_user.sent_orders
  end

  def search_order
    @courier = Courier.find_by(order_number: params[:order_number])
    if @courier.present?
      flash[:info] = "Order found."
      redirect_to courier_path(@courier.id)
    else
      flash[:danger] = "Order not found."
      redirect_to couriers_path
    end
  end

  def new
    @courier = current_user.couriers.build
    @users = User.where.not(id: current_user.id).pluck(:full_name, :id)
  end

  def create
    @courier = current_user.couriers.create(courier_params)
    if @courier.valid?
      flash[:info] = "Order Created Successfully."
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
