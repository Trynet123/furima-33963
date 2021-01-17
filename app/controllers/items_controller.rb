class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :shipping_charge_id, :presence, :days_to_ship_id, :price)
  end

end
