class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.valid?
      redirect_to root_path
    else
      render new_item_path
    end
  end

  private
  def item_params
    params.require(:item).permit(
      :name, :text, :prefecture_id, :category_id, :condition_id, :shipping_charge_id, :presence, :days_to_ship_id, :price, :image
    ).merge(user_id: current_user.id)
  end

end