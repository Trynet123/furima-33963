class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :text, :prefecture_id, :category_id, :condition_id, :shipping_charge_id, :presence, :days_to_ship_id, :price, :image
    ).merge(user_id: current_user.id)
  end
end
