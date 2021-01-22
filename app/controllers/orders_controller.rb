class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create, :pay_item]
  before_action :move_to_index, only: :index

  def index
    @order = Order.new
    set_item
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      set_item
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :postal_code,
      :prefecture_id,
      :city,
      :house_number,
      :phone_number,
      :building_name
    ).merge(
      item_id: params[:item_id],
      user_id: current_user.id,
      token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    set_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if current_user.id == @item.user.id
      redirect_to root_path 
    end
  end
end
