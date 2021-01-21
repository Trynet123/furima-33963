class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :city, :house_number, :phone_number, :building_name).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end